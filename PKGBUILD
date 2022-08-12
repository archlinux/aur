# Maintainer: Duy Truong <jimreynold2nd@yahoo.com>
pkgname=ubports-installer
pkgver=0.9.6_beta
_ver=${pkgver//_/-}
pkgrel=2
pkgdesc='A simple tool to install Ubuntu Touch on UBports devices'
arch=('x86_64' 'i686')
url='https://github.com/ubports/ubports-installer'
license=('GPL3')
depends=('android-tools' 'android-udev' 'electron' 'e2fsprogs' 'heimdall')
options=('!strip' '!emptydirs')
conflicts=('ubports-installer-git' 'ubports-installer-bin')
source=("$pkgname-$pkgver.deb::https://github.com/ubports/ubports-installer/releases/download/$_ver/ubports-installer_${_ver}_linux_amd64.deb")
sha256sums=('bc930578ef94d2b8df05ff34be8566e8d8976916ce5482d1f5bfffe2fe84bb00')

package() {
        tar xf data.tar.xz -C "${pkgdir}"
        install -D -m644 "${pkgdir}/opt/ubports-installer/resources/app.asar.unpacked/node_modules/universalify/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
