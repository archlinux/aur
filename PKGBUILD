# Maintainer: Danny Holman <dholman@gymli.org>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=apache-opennlp
pkgver=3.0.0
pkgrel=1
pkgdesc="A machine learning-based toolkit for the processing of natural language text"
arch=('any')
url="http://opennlp.apache.org/"
license=('Apache')
depends=('java-environment' 'bash')
source=("https://dlcdn.apache.org/opennlp/opennlp-3.0.0-M6/apache-opennlp-3.0.0-M6-bin.tar.gz")
sha512sums=('0d907088d28b00a68fee91a874fe0be2bf635df8335e4e8098159f3ad82cc6a2d3ebf83e8232350067f8c6f0bb4054eb5898c0f198209c613703ea6073e2d331')

prepare() {
        tar -xf apache-opennlp-3.0.0-M6-bin.tar.gz
}

package() {
        mkdir -p $pkgdir/usr/bin
        mkdir -p $pkgdir/usr/lib/opennlp
        mkdir -p $pkgdir/usr/share/doc/opennlp

        cp -r $srcdir/apache-opennlp-3.0.0-M6/lib/* $pkgdir/usr/lib/opennlp
        cp -r $srcdir/apache-opennlp-3.0.0-M6/docs/* $pkgdir/usr/share/doc/opennlp

        sed 's/$OPENNLP_HOME\/lib/$OPENNLP_HOME\/lib\/opennlp/g' < $srcdir/apache-opennlp-3.0.0-M6/bin/opennlp > $pkgdir/usr/bin/opennlp
        chmod +x $pkgdir/usr/bin/opennlp
}
