# Maintainer: Alex Pyattaev <alex pyattaev at google dot com>
pkgname='roc-nightly-bin'
_name='roc_nightly-linux_x86_64-latest'
pkgver=0.0
pkgrel=3
pkgdesc='A fast, friendly, functional language. Work in progress!'
arch=('x86_64')
url='https://github.com/roc-lang/roc'
license=('UPL1.0')
source=("https://github.com/roc-lang/roc/releases/download/nightly/${_name}.tar.gz")
md5sums=('SKIP')

package() {
    dirname=`tar --list -f ${_name}.tar.gz | head -n 1`
    echo "Using directory name ${dirname}"
    tar -xf ${_name}.tar.gz
    install -Dm755 "${dirname}/roc" "${pkgdir}/usr/bin/roc"
    install -Dm444 "${dirname}/LICENSE" "${pkgdir}/usr/share/roc/LICENSE"
    install -Dm444 "${dirname}/LEGAL_DETAILS" "${pkgdir}/usr/share/roc/LEGAL_DETAILS"
    cp -r "${dirname}/examples" "${pkgdir}/usr/share/roc/"
}
