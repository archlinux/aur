#Author: Manojavya
#Maintainer: Manojavya

pkgname=optomizer
pkgver=3.4.0
pkgrel=1
# Haha lol this kinda cringe tbh.
pkgdesc="Optomizer the optimization tool for power users"
arch=('any')
url="https://github.com/manojavya/Optomizer"
license=('MIT')
depends=('jdk21-openjdk')
makedepends=('git')
source=("git+https://github.com/manojavya/Optomizer.git")
sha256sums=('SKIP')
# This is how we comment in PKGBUILD... The more you know 🥀.
package() {
    cd Optomizer/

    install -Dm644 Optomizer_v3-4-0.jar \
        "$pkgdir/usr/share/optomizer/Optomizer.jar"

    install -Dm755 /dev/stdin \
        "$pkgdir/usr/bin/optomizer" <<EOF
#!/usr/bin/env bash
exec java -jar /usr/share/optomizer/Optomizer.jar "\$@"
EOF
}
