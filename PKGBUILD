# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=subconverter-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='Utility to convert between various proxy subscription formats'
arch=('x86_64')
url="https://github.com/tindy2013/subconverter"
license=('GPL-3.0')
provides=('subconverter')
source=("${url}/releases/download/v${pkgver}/subconverter_linux64.tar.gz")
md5sums=('1a404b075145eef9fc624011cec5d90d')

prepare() {
  cd "${srcdir}/subconverter"
  echo "#!/usr/bin/env bash

/opt/subconverter/subconverter" > subconverter.sh
  chmod 755 subconverter.sh
}

package() {
	mkdir -p "${pkgdir}/opt/subconverter"
	cp -aR "${srcdir}"/subconverter/* "${pkgdir}/opt/subconverter"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s /opt/subconverter/subconverter.sh "${pkgdir}/usr/bin/subconverter"
}
# vim:set ts=2 sw=2 et: