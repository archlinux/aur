# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_upstreamver='0.4.4'
#_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
#_source_type='github-tags' # FIXME: This repo does not have releases in github yet
_repo='dave-howard/vsdx'
_commitver='06928c85b6d0e5dcd9b94a2d983257b6f6f061e8'

pkgname='python-vsdx'
_pkgname='vsdx'
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A python library for processing Visio .vsdx files"
url="https://github.com/${_repo}"
depends=('python' 'python-sphinx' 'python-sphinx_rtd_theme' 'python-jinja')
makedepends=('cython' 'python-setuptools')
license=('BSD-3-Clause')
arch=('any')
source=("git://github.com/${_repo}#commit=${_commitver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${_pkgname}/"
    python setup.py build_ext --inplace
}

package() {
    cd "${srcdir}/${_pkgname}/"
    python setup.py install --root="${pkgdir}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
