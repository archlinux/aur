# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_upstreamver='0.0.1'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='custom'
_repo='Dunes/json_stream'
_upstreamver_check() {
    # TODO
    printf '%s' "${_upstreamver}"
}


pkgname='python-jsonstream'
_pkgname='jsonstream'
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Load multiple delimited JSON documents from a single string or file-like object"
url="https://github.com/${_repo}"
depends=('python')
makedepends=('cython' 'python-setuptools')
license=('mit')
arch=('any')
source=("https://files.pythonhosted.org/packages/10/51/711ce898fe7d9f489cdb0e8a71f577ea00a4adbdb32d4e0bf9b4e0cc6bf8/jsonstream-${pkgver}.tar.gz")
sha256sums=('1fde9fd4ee3a8ad028bbe91489c4544980c930974289f2409d964e35a5623543')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    python setup.py build_ext --inplace
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    python setup.py install --root="${pkgdir}"
}
