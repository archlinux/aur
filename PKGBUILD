# Maintainer: Mark K. <markus@sovereign-society.org>
# Maintainer note: this package is updated automatically from release artifacts
# in graf's Forgejo repository via CI.

pkgname=graf-bin
pkgver=0.5.48.alpha.2
pkgrel=1
pkgdesc='Binary Graf, prebuilt for easy install'
arch=('x86_64')
url='https://git.sovereign-society.org/markus/graf'
license=('custom:LCL-1.0')
depends=('glibc')
provides=('graf')
conflicts=('graf' 'graf-git')

_upstream_repo='https://git.sovereign-society.org/markus/graf'
_upstream_tag='v0.5.48-alpha.2'
_binary_asset='graf-0.5.48-alpha.2-x86_64'
_binary_name='graf-0.5.48-alpha.2-x86_64'

source=("${_binary_name}::${_upstream_repo}/releases/download/${_upstream_tag}/${_binary_asset}")
sha256sums=('SKIP')

package() {
    local source_path="${srcdir}/${_binary_name}"

    if [[ ! -f "${source_path}" ]]; then
        echo "Unable to locate binary source file at ${source_path}" >&2
        return 1
    fi

    install -Dm755 "${source_path}" "$pkgdir/usr/bin/graf"
}
