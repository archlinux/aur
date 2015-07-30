# Maintainer: Sebastian Lau <archlinux _at_ slau _dot_ info>
# Contributor: Arno K <arnok at users dot noreply dot github dot com>

_mintrel=rafaela
pkgname=nemo-compare
pkgver=2.6.0
pkgrel=1
pkgdesc="Context menu comparison extension for Nemo file manager"
arch=("any")
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL3')
depends=('nemo>=1' 'nemo-python>=1.0' 'python-xdg' 'python2' 'meld')
install=${pkgname}.install
source=("http://packages.linuxmint.com/pool/main/n/${pkgname}/${pkgname}_${pkgver}%2b${_mintrel}.tar.gz")
sha256sums=('92a8e7861218f572a1091a14d0d0e9f7b95b82e914948847e61c25f53f57d904')


package() {
  cd ${pkgname}-${pkgver}+${_mintrel}

  install -D data/nemo-compare-preferences.desktop -t "${pkgdir}/usr/share/applications"
  install -D data/nemo-compare-notification -t "${pkgdir}/usr/share/${pkgname}"
  install -D src/* -t "${pkgdir}/usr/share/${pkgname}/"

  install -d "${pkgdir}/usr/share/nemo-python/extensions"
  install -d "${pkgdir}/usr/bin"

  ln -s /usr/share/nemo-compare/nemo-compare.py "${pkgdir}/usr/share/nemo-python/extensions/nemo-compare.py"
  ln -s /usr/share/nemo-compare/nemo-compare-preferences.py "${pkgdir}/usr/bin/nemo-compare-preferences"
}
