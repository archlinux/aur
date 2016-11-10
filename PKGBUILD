# Maintainer: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Serede Sixty Six <serede.dev@gmail.com>

pkgname=nemo-audio-tab
pkgver=3.2.0
pkgrel=1
pkgdesc="View audio tag information from the file manager's properties tab"
arch=('any')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
groups=('nemo-extensions')
depends=('nemo>=3.2' 'nemo-python' 'python-mutagen')
makedepends=('python-distutils-extra')

options=('!libtool' '!emptydirs')

source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('1536fd828b2ee0a8f194155a9e13b8cce937b403b5c87d8e579d7b1ced8d6d14')

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  # Python2 fix
  find -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

  install -d ${pkgdir}/usr/share/nemo-python/extensions
  install ${srcdir}/nemo-extensions-${pkgver}/${pkgname}/nemo-extension/nemo-audio-tab.py ${pkgdir}/usr/share/nemo-python/extensions
  install ${srcdir}/nemo-extensions-${pkgver}/${pkgname}/nemo-extension/nemo-audio-tab.glade ${pkgdir}/usr/share/nemo-python/extensions
}
