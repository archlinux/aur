# Maintainer: Leonid Lednev <GI_Jack@hackermail.com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>
pkgname=python-aiosmb
pkgver=0.4.14
pkgrel=1
pkgdesc="Fully asynchronous SMB library written in pure python."
url="https://github.com/skelsec/aiosmb"
arch=('any')
license=('MIT')
depends=(
  'python>=3.7'
  'python-unicrypto>=0.0.12'
  'python-asyauth>=0.0.23'
  'python-asysocks>=0.2.18'
  'python-prompt_toolkit>=3.0.2'
  'python-winacl>=0.1.9'
  'python-six'
  'python-tqdm'
  'python-colorama'
  'python-asn1crypto'
  'python-wcwidth'
  'python-cryptography'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools>=61.0.0'
  'git'
)
source=("git+$url#tag=$pkgver")
b2sums=('53eb804a3351a7c476079d01d7a4ff52312e867f47b7114d878323cae77db6ca01163041f085a0fc953c1a5342c3ff6f54a5fe7713c942c35ea8e6bf84ae7c73')

prepare() {
  git -C aiosmb clean -dfx
}

build() {
  cd aiosmb
  python -m build -wnx
}

package() {
  cd aiosmb
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
