pkgname=optomizer
pkgver=3.1.0
pkgrel=1
pkgdesc="Optomizer Java application"
arch=('any')
url="https://github.com/AlphaWolf6940/Optomizer"
license=('MIT')
depends=('jdk-openjdk')
makedepends=('git')
source=("git+https://github.com/AlphaWolf6940/Optomizer.git")
sha256sums=('SKIP')

package() {
    cd Optomizer/bin-30-11-25

    install -Dm644 OptomizerV3.1.0.jar \
        "$pkgdir/usr/share/optomizer/Optomizer.jar"

    install -Dm755 /dev/stdin \
        "$pkgdir/usr/bin/optomizer" <<EOF
#!/usr/bin/env bash
exec java -jar /usr/share/optomizer/Optomizer.jar "\$@"
EOF
}
