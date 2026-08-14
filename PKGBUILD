# Maintainer: Mark K. <markus@sovereign-society.org>
# Maintainer note: this package is updated automatically from release artifacts
# in graf's Forgejo repository via CI.

pkgname=graf-bin
pkgver=0.7.0.alpha
pkgrel=1
pkgdesc='Git replacement: Sovereign version control for operators and agents'
arch=('x86_64')
url='https://www.graf-forge.org'
license=('custom:LCL-1.0')
depends=('glibc')
provides=('graf')
conflicts=('graf' 'graf-git')

_upstream_repo='https://git.sovereign-society.org/graf-vcs/graf'
_upstream_tag='v0.7.0-alpha'
_binary_asset='graf-0.7.0-alpha-x86_64'
_binary_name='graf-0.7.0-alpha-x86_64'

source=("${_binary_name}::${_upstream_repo}/releases/download/${_upstream_tag}/${_binary_asset}")
sha256sums=('bd1fd3d37a78cfe45a78665b2a18bef9660d5feb313f6c2103577d8f3d96c19b')

package() {
    local source_path="${srcdir}/${_binary_name}"

    if [[ ! -f "${source_path}" ]]; then
        echo "Unable to locate binary source file at ${source_path}" >&2
        return 1
    fi

    install -Dm755 "${source_path}" "$pkgdir/usr/bin/graf"
}
