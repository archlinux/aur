# Maintainer: Gilwiljam <gillbilljam@gmail.com>
# Contributor: Samuel Corsi-House <chouse.samuel@gmail.com>
_pkgname=playit
pkgname=$_pkgname-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="A tunneling tool to host a game server without port forwarding or sharing public IP (Binary version)"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/playit-cloud/playit-agent"
license=('BSD-2-Clause') 
provides=('playit')
conflicts=(playit)

source_x86_64=("$_pkgname-$pkgver.deb::https://playit-cloud.github.io/ppa/data/${_pkgname}_${pkgver}_amd64.deb")  
sha256sums=('f9d32c6b4a6055b2bfa48543d68119efc46ea4606f0d9cc973cb273dcd59be9c')
sha256sums_x86_64=('9e3db7b04cbc806a1b05efca37c642281989b30716aebc5c657b43b712dae6c2')
sha256sums_aarch64=('9e3db7b04cbc806a1b05efca37c642281989b30716aebc5c657b43b712dae6c2')
sha256sums_i686=('9e3db7b04cbc806a1b05efca37c642281989b30716aebc5c657b43b712dae6c2')
sha256sums_armv7h=('9e3db7b04cbc806a1b05efca37c642281989b30716aebc5c657b43b712dae6c2')

source_aarch64=("$_pkgname-$pkgver.deb::https://playit-cloud.github.io/ppa/data/${_pkgname}_${pkgver}_arm64.deb")

source_i686=("$_pkgname-$pkgver.deb::https://playit-cloud.github.io/ppa/data/${_pkgname}_${pkgver}_i386.deb")

source_armv7h=("$_pkgname-$pkgver.deb::https://playit-cloud.github.io/ppa/data/${_pkgname}_${pkgver}_armhf.deb")

source=("LICENSE.txt::https://raw.githubusercontent.com/playit-cloud/playit-agent/master/LICENSE.txt") 


package() {
	bsdtar -xf data.tar.gz -C "$pkgdir/"

	mv "$pkgdir/lib/systemd" "$pkgdir/etc"
	rm -r "$pkgdir/lib"

	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
