# Maintainer: Robert Rosca <32569096+RobertRosca@users.noreply.github.com>

pkgname=ruff-bin
_pkgname=${pkgname%-bin}
conflicts=('ruff')
provides=('ruff')
_pkgver=v0.2.2
pkgver=${_pkgver#v}
pkgrel=2
pkgdesc='An extremely fast Python linter and code formatter, written in Rust.'
arch=(aarch64 i686 x86_64)
url='https://github.com/astral-sh/ruff'
license=('MIT')

_release_url='https://api.github.com/repos/astral-sh/ruff/releases/latest'

source_aarch64=(https://github.com/astral-sh/ruff/releases/download/v$pkgver/ruff-$pkgver-aarch64-unknown-linux-gnu.tar.gz)
source_i686=(https://github.com/astral-sh/ruff/releases/download/v$pkgver/ruff-$pkgver-i686-unknown-linux-gnu.tar.gz)
source_x86_64=(https://github.com/astral-sh/ruff/releases/download/v$pkgver/ruff-$pkgver-x86_64-unknown-linux-gnu.tar.gz)

sha256sums_aarch64=('0bd2932f652f72386a0ab837a2cf2933c21883fbf25294caf881f667927c39c9')
sha256sums_i686=('39f9b9c9ae4d84ce69c011d72b8870831897888b7d79233bc0710fc374ae59e7')
sha256sums_x86_64=('86089b6e8654c6ede8fd00766429eb31b18bc2cc56241935d1e3e2df84fafea3')

check() {
  ./ruff --version
}

package() {
  install -Dm755 ruff "${pkgdir}/usr/bin/ruff"
}
