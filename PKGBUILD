# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=general-preprocessor
pkgver=1.6
pkgrel=1
pkgdesc="Bash-based preprocessor for anything"
url="https://github.com/maandree/gpp"
arch=(any)
license=(GPL3)
depends=(python bash)
makedepends=(make coreutils python texinfo auto-auto-complete)
install=general-preprocessor.install
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(46aa12e2ac51f235c801d0751686e6699efd51fa063078b8e13a0d63cf277dde)

_prefix=/usr
_command=gpp ## change this if you have a package conflicting package


build() {
        cd "${srcdir}/gpp-${pkgver}"
        make PREFIX="${_prefix}" PKGNAME="${pkgname}" COMMAND="${_command}" DESTDIR="${pkgdir}" PY=python3
}

package() {
        cd "${srcdir}/gpp-${pkgver}"
        make PREFIX="${_prefix}" PKGNAME="${pkgname}" COMMAND="${_command}" DESTDIR="${pkgdir}" PY=python3 install
        _dir="${pkgdir}${_prefix}/share/licenses/${pkgname}"
        ln -sf -- "/usr/share/licenses/common/GPL3" "${_dir}/LICENSE"
}

