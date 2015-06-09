pkgname=opensim-rake
pkgver=20131012
pkgrel=1
pkgdesc="Rake is meant to dump assets (textures, animations, notecards, scripts, etc...) from either Second Life™ or OpenSim to your local hard-drive."
arch=(any)
url="http://was.fm/opensim:rake"
license=("GPLv3")
depends=(mono)
source=("http://was.fm/_media/opensim/rake.zip"
"opensim-rake.sh")
md5sums=('53518eab4f5849f5bfaed4ba4149df5e'
         '949e23cccf789411a842cb230282d2de')

package() {
	install -Dm755 opensim-rake.sh "$pkgdir/usr/bin/opensim-rake"
	cd Rake
	install -Dm644 Rake.exe "$pkgdir/usr/lib/opensim-rake/Rake.exe"
	install -m644 Rake.exe.config "$pkgdir/usr/lib/opensim-rake/"
	cd libomv
  find . -name '*.dll' -exec install -Dm644 {} "$pkgdir/usr/lib/opensim-rake/libomv/"{} \;
  find . -name '*.so' -exec install -m644 {} "$pkgdir/usr/lib/opensim-rake/libomv/" \;
  cd openmetaverse_data
  find . -type f -exec install -Dm644 {} "$pkgdir/usr/lib/opensim-rake/openmetaverse_data/"{} \;
  cd "$pkgdir/usr/lib/opensim-rake/libomv"
  rm openjpeg*.dll
}

# vim:set ts=2 sw=2 et:
