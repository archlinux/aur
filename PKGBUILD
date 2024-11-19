# Maintainer: NikoMitK
pkgname=downloads-sorter
pkgver=0.3.0
pkgrel=1
pkgdesc="A simple tool to sort your downloaded files into folders based on their file extension and age."
arch=('any')
url="https://github.com/NikomitK/DownloadsSorter"
license=('MIT')
depends=('java-runtime')
source=("https://github.com/NikomitK/DownloadsSorter/releases/download/v0.3.0-beta/downloads-sorter-0.3.0-beta.jar")
sha256sums=('929a8cf7814b49225979bb5dfdadc6f754a63b9bd370a95d5e061af0e9cad6bb')

package() {
    install -Dm644 "$srcdir/downloads-sorter-0.3.0-beta.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/bash
exec /usr/bin/java -jar /usr/share/java/downloads-sorter/downloads-sorter.jar "$@"
EOF
}
