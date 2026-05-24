pkgname=optomizer
pkgver=3.3.0
pkgrel=1
pkgdesc="Optomizer Java application"
arch=('any')
url="https://github.com/AlphaWolf6940/Optomizer"
license=('MIT')
depends=('jdk21-openjdk')
makedepends=('git')
source=("git+https://github.com/AlphaWolf6940/Optomizer.git")
sha256sums=('SKIP')

package() {
    cd Optomizer/

    install -Dm644 Optomizer_v3-3-0.jar \
        "$pkgdir/usr/share/optomizer/Optomizer.jar"

    install -Dm755 /dev/stdin \
        "$pkgdir/usr/bin/optomizer" <<EOF
#!/usr/bin/env bash
exec java -jar /usr/share/optomizer/Optomizer.jar "\$@"
EOF
}
