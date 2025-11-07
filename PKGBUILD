# Maintainer: Adrien Czerny <adrien@czerny.fr>
pkgname=qqqa-bin
_name=qqqa
pkgver=0.9.0
pkgrel=1
pkgdesc="Fast, stateless LLM for your shell: qq answers; qa runs commands"
provides=(qqqa)
install=post.install
arch=(x86_64)
url=https://github.com/iagooar/qqqa
license=('GPL')
source=("https://github.com/iagooar/qqqa/releases/download/v$pkgver/$_name-v$pkgver-x86_64-unknown-linux-musl.tar.gz"
        "post.install"
        "config-example.json")
md5sums=("9e0295085e2d437ca2da295212111605"
         "310e07bc1aa361548ecbfa8161fa2275"
         "e34e0e7765247b39f76e7db1a3748fa2")

package() {
    install -Dm 755 "$srcdir"/qq "$pkgdir"/usr/bin/qq
    install -Dm 755 "$srcdir"/qa "$pkgdir"/usr/bin/qa
    install -Dm 644 "$srcdir"/config-example.json "$pkgdir"/usr/share/qq/config-example.json
}
