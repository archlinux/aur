# Maintainer: thomashrb <thomashrb AT protonmail DOT com>
# Contributor: Sérgio Gomes <superherointj at gmail dot com>
pkgname=ponyup
pkgver=0.6.1
pkgrel=1
pkgdesc="The Pony language toolchain multiplexer"
arch=('x86_64')
url="https://github.com/ponylang/ponyup"
license=('BSD')
makedepends=(
  'curl'
  'sed'
  'tar'
)
depends=('openssl')
source_x86_64=($ponyup-$pkgver-x86_64.tar.gz::https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$pkgver/ponyup-x86-64-unknown-linux.tar.gz)
sha256sums_x86_64=('SKIP')

install=${pkgname}.install

prepare() {
  tmp_dir=/tmp/ponyup
  mkdir -p "${tmp_dir}"
  tar -xzf "${tmp_dir}/ponyup-x86-64-unknown-linux.tar.gz" -C "${tmp_dir}"
}

package() {
  unpacked_file=$(find ${tmp_dir} -name ponyup -type f)
  install_dir=$HOME/.local/share/ponyup/bin
  mkdir -p $install_dir
  install -Dm755  $unpacked_file $install_dir
}
