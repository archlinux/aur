# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Sergiy Kukunin <sergey.kukunin@gmail.com>

pkgname=cpuminer-multi
_commit=6d51b16863064e2d42bc87f2ad6ccee30a454102
pkgver=1.3.7
pkgrel=1
pkgdesc='Multi-algo CPUMiner & Reference Cryptonote Miner (JSON-RPC 2.0)'
arch=('x86_64')
url="https://github.com/tpruvot/$pkgname"
license=('GPL')
depends=('curl' 'jansson' 'openssl')
provides=('cpuminer')
conflicts=('cpuminer' 'cpuminer-multi-git')
#source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver-multi.tar.gz")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('822a64d508fdec94d7076ba189f0e1c6a453d8a0edac3d9c45bd25f7f521bbf3')

build() {
  #cd "$pkgname-$pkgver-multi"
  cd "$pkgname-$_commit"

  ./autogen.sh
  ./configure --prefix=/usr --with-crypto --with-curl
  make
}

package() {
  #cd "$pkgname-$pkgver-multi"
  cd "$pkgname-$_commit"

  make DESTDIR="$pkgdir/" install
}
