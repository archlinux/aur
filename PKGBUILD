# Maintainer: tuftedocelot@fastmail.fm
_pkgname=yubioath-desktop
pkgname=yubico-${_pkgname}
pkgver=3.1.0
pkgrel=2
pkgdesc="Crossplatform graphical user interface to generate one-time passwords."
arch=('i686' 'x86_64')
url="https://developers.yubico.com/yubioath-desktop/"
license=('GPL')
depends=('pcsclite' 'ccid' 'python-pyside' 'python-pyscard' 'python-pbkdf2' 'python-setuptools' 'python-pyside-tools' 'python-crypto' 'yubikey-personalization' 'python-click')
source=("https://github.com/Yubico/yubioath-desktop/releases/download/$_pkgname-$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('7caae0fd3b14529476eda3a5660bc050584b298ddc3c8d1adfe221041fa5db49')
conflicts=('yubico-yubioath-desktop-git')

package() {
    mkdir -p ${pkgdir}/usr/bin
	
    cd "${srcdir}/$_pkgname-${pkgver}"
	python setup.py install --root=${pkgdir}

    mkdir -p ${pkgdir}/usr/share/applications/
    install -D -m0644 ${srcdir}/$_pkgname-${pkgver}/resources/yubioath.desktop ${pkgdir}/usr/share/applications/
    mkdir -p ${pkgdir}/usr/share/pixmaps
    install -D -m0644 ${srcdir}/$_pkgname-${pkgver}/resources/yubioath.xpm ${pkgdir}/usr/share/pixmaps
}
