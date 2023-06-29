# Maintainer: Buf <bot@buf.build>
# Contributor: William Turner <willtur.will@gmail.com>
pkgname=buf-bin
pkgver=1.23.0
pkgrel=1
pkgdesc="A new way of working with Protocol Buffers."
arch=('x86_64')
url="https://buf.build"
license=('Apache')
provides=('buf')
conflicts=('buf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bufbuild/buf/releases/download/v$pkgver/buf-Linux-x86_64.tar.gz")
sha256sums=('28cbfd678fd7a832ca3b8ad4b650434c2e1c5d09760d959a77f41ba4b094293a')

package() {
  install -D -m755 "$srcdir/buf/bin/buf" "$pkgdir/usr/bin/buf"
  install -D -m755 "$srcdir/buf/bin/protoc-gen-buf-breaking" "$pkgdir/usr/bin/protoc-gen-buf-breaking"
  install -D -m755 "$srcdir/buf/bin/protoc-gen-buf-lint" "$pkgdir/usr/bin/protoc-gen-buf-lint"
  install -D -m644 "$srcdir/buf/etc/bash_completion.d/buf" "$pkgdir/etc/bash_completion.d/buf"
  install -D -m644 "$srcdir/buf/share/zsh/site-functions/_buf" "$pkgdir/usr/share/zsh/site-functions/_buf"
}
