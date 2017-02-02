# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Serede Sixty Six <serede.dev@gmail.com>

pkgname='nemo-audio-tab'
pkgver=3.2.1
_mintrel='betsy'
pkgrel=1
pkgdesc="View audio tag information in Nemo's properties tab"
arch=('any')
license=('GPL2')
url="https://github.com/linuxmint/nemo-extensions"
depends=('nemo-python' 'mutagen')
makedepends=('python2-distutils-extra')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::http://packages.linuxmint.com/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}+${_mintrel}.tar.gz")
sha256sums=('852c08c0f6f2d725e1ad2b22d3f272e8373cda1be4e5359d8e707168fddc227d')

prepare() {
  cd ${pkgname}-${pkgver}+${_mintrel}

  # Python2 fix
  find -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
}

package() {
  cd ${pkgname}-${pkgver}+${_mintrel}

  python2 ./setup.py install --prefix=/usr --root=${pkgdir}
}
