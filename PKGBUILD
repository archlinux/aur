# Maintainer: Lulu Cathrinus Grimalkin <erkin@sdf.org>
pkgname=loko
pkgver=0.12.1
pkgrel=1
pkgdesc="An optimizing R6RS Scheme compiler"
arch=("x86_64")
url="https://scheme.fail"
license=("AGPL3")
depends=("chez-scheme" "akku")
options=(!strip)
source=("https://scheme.fail/releases/loko-0.12.1.tar.gz"
        "https://scheme.fail/releases/loko-0.12.1.tar.gz.sig")
sha256sums=("404b4cf89002130355a4ac9e39ae6fb07cfca05759fc9b5081f9f62943cfba7b"
            "SKIP")
validpgpkeys=('08272FBB54EEB5072D5BA930E33E61A2E9B8C3A2') # Göran Weinholt

build()
{
    cd "$pkgname-$pkgver"
    make PREFIX="/usr"
}

package()
{
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" PREFIX="/usr" install-all
}
