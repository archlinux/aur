# Maintainer: Johan Brandhorst <jbrandhorst@buf.build>
# Contributor: William Turner <willtur.will@gmail.com>
pkgname=buf-bin
pkgver=0.30.0
pkgrel=1
pkgdesc="A new way of working with Protocol Buffers."
arch=('x86_64')
url="https://buf.build"
license=('Apache')
provides=('buf')
conflicts=('buf')
source=("https://github.com/bufbuild/buf/releases/download/v$pkgver/buf-Linux-x86_64.tar.gz")
sha256sums=('a00c2be934372866bf512b2eabc39cd9a2c8c701ede65ad6a600bc754b861560')

package() {
  install -D -m755 "$srcdir/buf/bin/buf" "$pkgdir/usr/bin/buf"
  install -D -m755 "$srcdir/buf/bin/protoc-gen-buf-check-breaking" "$pkgdir/usr/bin/protoc-gen-buf-check-breaking"
  install -D -m755 "$srcdir/buf/bin/protoc-gen-buf-check-lint" "$pkgdir/usr/bin/protoc-gen-buf-check-lint"
  install -D -m644 "$srcdir/buf/etc/bash_completion.d/buf" "$pkgdir/etc/bash_completion.d/buf"
  install -D -m644 "$srcdir/buf/share/zsh/site-functions/_buf" "$pkgdir/usr/share/zsh/site-functions/_buf"
}
