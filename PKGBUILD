# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase=('tracktime')
pkgname=('tracktime')
_module='tracktime'
pkgver='0.9.6'
pkgrel=1
pkgdesc='Time tracking library with command line interface.'
url='https://gitlab.com/sumner/tracktime'
depends=(
    'python'
    'python-argcomplete'
    'python-docutils'
    'python-pdfkit'
    'python-requests'
    'python-tabulate'
    'python-yaml'
)
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=('https://files.pythonhosted.org/packages/source/t/tracktime/tracktime-0.9.6.tar.gz')
sha256sums=('7d348e62764b83cb51cf8cfc0259b49a91ca41e89ebfd1a247ea5e3f64c69b53')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
