# Maintainer: Buf <bot@buf.build>
# Contributor: William Turner <willtur.will@gmail.com>
pkgname=buf-bin
pkgver=1.47.2
pkgrel=1
pkgdesc="A new way of working with Protocol Buffers."
arch=('x86_64')
url="https://buf.build"
license=('Apache')
provides=('buf')
conflicts=('buf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bufbuild/buf/releases/download/v$pkgver/buf-Linux-x86_64.tar.gz")
sha256sums=('39716cfe0185df3cba21f66ec739620ffb6876c48b2da4338a8c68c290c9b116')

package() {
  install -D -m755 "$srcdir/buf/bin/buf" "$pkgdir/usr/bin/buf"
  install -D -m755 "$srcdir/buf/bin/protoc-gen-buf-breaking" "$pkgdir/usr/bin/protoc-gen-buf-breaking"
  install -D -m755 "$srcdir/buf/bin/protoc-gen-buf-lint" "$pkgdir/usr/bin/protoc-gen-buf-lint"
  install -D -m644 "$srcdir/buf/etc/bash_completion.d/buf" "$pkgdir/etc/bash_completion.d/buf"
  install -D -m644 "$srcdir/buf/share/zsh/site-functions/_buf" "$pkgdir/usr/share/zsh/site-functions/_buf"
}
