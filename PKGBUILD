# Maintainer: Johan Brandhorst <jbrandhorst@buf.build>
# Contributor: William Turner <willtur.will@gmail.com>
pkgname=buf-bin
pkgver=0.49.0
pkgrel=1
pkgdesc="A new way of working with Protocol Buffers."
arch=('x86_64')
url="https://buf.build"
license=('Apache')
provides=('buf')
conflicts=('buf')
source=("https://github.com/bufbuild/buf/releases/download/v$pkgver/buf-Linux-x86_64.tar.gz")
sha256sums=('e79786ba12da3a59c1ff599f766078a5673b5687ad29b0a8711592461d41c412')

package() {
  install -D -m755 "$srcdir/buf/bin/buf" "$pkgdir/usr/bin/buf"
  install -D -m755 "$srcdir/buf/bin/protoc-gen-buf-check-breaking" "$pkgdir/usr/bin/protoc-gen-buf-check-breaking"
  install -D -m755 "$srcdir/buf/bin/protoc-gen-buf-check-lint" "$pkgdir/usr/bin/protoc-gen-buf-check-lint"
  install -D -m644 "$srcdir/buf/etc/bash_completion.d/buf" "$pkgdir/etc/bash_completion.d/buf"
  install -D -m644 "$srcdir/buf/share/zsh/site-functions/_buf" "$pkgdir/usr/share/zsh/site-functions/_buf"
}
