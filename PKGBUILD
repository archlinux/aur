# Maintainer: Mark K. <markus@sovereign-society.org>
# Maintainer note: this package is updated automatically from release artifacts
# in graf's Forgejo repository via CI.

pkgname=graf-bin
pkgver=0.6.0.alpha.1
pkgrel=1
pkgdesc='Git replacement: Sovereign version control for operators and agents'
arch=('x86_64')
url='https://www.graf-forge.org'
license=('custom:LCL-1.0')
depends=('glibc')
provides=('graf')
conflicts=('graf' 'graf-git')

_upstream_repo='https://git.sovereign-society.org/markus/graf'
_upstream_tag='v0.6.0-alpha.1'
_binary_asset='graf-0.6.0-alpha.1-x86_64'
_binary_name='graf-0.6.0-alpha.1-x86_64'

source=("${_binary_name}::${_upstream_repo}/releases/download/${_upstream_tag}/${_binary_asset}")
sha256sums=('1d630036dcd72ddd495254073bcb915182f0071e8d5df4889ed75f661464f662')

package() {
    local source_path="${srcdir}/${_binary_name}"

    if [[ ! -f "${source_path}" ]]; then
        echo "Unable to locate binary source file at ${source_path}" >&2
        return 1
    fi

    install -Dm755 "${source_path}" "$pkgdir/usr/bin/graf"
}
