# Maintainer: tuftedocelot@fastmail.fm
_pkgname=yubioath-desktop
pkgname=yubico-${_pkgname}
pkgver=2.3.0
pkgrel=2
pkgdesc="Crossplatform graphical user interface to generate one-time passwords."
arch=('i686' 'x86_64')
url="https://developers.yubico.com/yubioath-desktop/"
license=('GPL')
depends=('python2' 'pcsclite' 'ccid' 'python2-pyside' 'python2-pyscard-svn' 'python2-pbkdf2' 'python2-setuptools' 'python2-crypto' 'yubikey-personalization')
source=("https://github.com/Yubico/yubioath-desktop/releases/download/$_pkgname-$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('df91f1592c069ead9d0ee4653aadd5d00fe5b93f0688e6e8ad3d7116a894b12e')
conflicts=('yubico-yubioath-desktop-git')

package() {
    mkdir -p ${pkgdir}/usr/bin
	
    cd "${srcdir}/$_pkgname-${pkgver}"
	python2 setup.py install --root=${pkgdir}

    mkdir -p ${pkgdir}/usr/share/applications/
    install -D -m0644 ${srcdir}/$_pkgname-${pkgver}/resources/yubioath.desktop ${pkgdir}/usr/share/applications/
    mkdir -p ${pkgdir}/usr/share/pixmaps
    install -D -m0644 ${srcdir}/$_pkgname-${pkgver}/resources/yubioath.xpm ${pkgdir}/usr/share/pixmaps
}
