# Maintainer: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Serede Sixty Six <serede.dev@gmail.com>

pkgname=nemo-audio-tab
pkgver=3.0.0
_mintrel=betsy
pkgrel=1
pkgdesc="View audio tag information from the file manager's properties tab"
arch=('any')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
groups=('nemo-extensions')
depends=('nemo>=3.0' 'nemo<3.1' 'nemo-python' 'python-mutagen')
makedepends=('python-distutils-extra')

options=('!libtool' '!emptydirs')

source=("http://packages.linuxmint.com/pool/main/n/${pkgname}/${pkgname}_${pkgver}+${_mintrel}.tar.gz")
sha256sums=('3442e3aeb7fb8718ed18ba2bb4be54143fd2253d5df3ed75c1ca3f6954076d92')

package() {
  # Python2 fix
  find -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

  install -d ${pkgdir}/usr/share/nemo-python/extensions
  install ${srcdir}/${pkgname}-${pkgver}+${_mintrel}/nemo-extension/nemo-audio-tab.py ${pkgdir}/usr/share/nemo-python/extensions
  install ${srcdir}/${pkgname}-${pkgver}+${_mintrel}/nemo-extension/nemo-audio-tab.glade ${pkgdir}/usr/share/nemo-python/extensions
}
