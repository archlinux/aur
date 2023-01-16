# Maintainer: Matthew A. <matthewa@duck.com>
# Contributor: Daniel Leining <daniel@the-beach.co>

pkgname=chunky-launcher
pkgver=1.14.0
pkgrel=1
pkgdesc="Launcher for Chuky, the Minecraft mapping and rendering tool"
url="http://chunky.llbit.se/"
arch=('any')
license=('GPL3')
depends=('java-runtime=17' 'java-openjfx=17')
source=(ChunkyLauncher.jar::https://chunkyupdate.lemaik.de/ChunkyLauncher.jar
       chunky-launcher.sh
	   chunky-launcher.desktop)
sha512sums=('2d319e1a13a6808b6978b82deba8eb371d4b9b01504c5bfdb3fcfa2218decaa6a07194bc054e00586ae136f702cfda4071788855917e06ed63435da4931d3788' 
			'7ce6f5937a1f844ddbc1db8fa1c219e2816cf244c56b68214f43a5d994198d3ff5cad2a844b1dda1aaa99984ec1adc4a9c8eb085dc3f8da6ce6c51bbe5bde4bd'
			'c5f78c60ad94d7f6c8b2ed334386a6731a5961f12a6b42de4518fcc23b367773dd6a5b0f46d35b0d6d3b2617052f0d32c5e7afc0befe7de43ae3d400d7530b53')

build() {
  bsdtar -xf ChunkyLauncher.jar "*chunky-cfg.png"
  find . -name "chunky-cfg.png" -exec mv {} . \;
}

package() {
  install -Dm755 chunky-launcher.sh "$pkgdir/usr/bin/chunky-launcher"
  install -Dm644 ChunkyLauncher.jar "$pkgdir/usr/share/java/chunky/ChunkyLauncher.jar"
  install -Dm644 chunky-launcher.desktop "$pkgdir/usr/share/applications/chunky-launcher.desktop"
  install -Dm644 chunky-cfg.png "$pkgdir/usr/share/pixmaps/chunky.png"
}

