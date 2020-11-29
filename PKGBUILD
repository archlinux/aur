# Maintainer: Daniel Plank <tyrolyean@gmx.at>
pkgname=electric
pkgver=9.08d
pkgrel=1
pkgdesc="a sophisticated electrical CAD system for the design of \
        integrated circuits"
arch=(any)
url="https://www.gnu.org/software/electric/"
license=('GPL')
depends=('java-environment<=8' 'bash')
makedepends=('svn' 'java-environment-openjdk<=8' 'apache-ant')
provides=(gnu-electric)
source=("svn://svn.savannah.gnu.org/electric"
        "https://www.gnu.org/software/$pkgname/$pkgname.jpg"
        "electric.desktop"
        "electric.sh")
sha512sums=('SKIP'
            '7c0d30876202dfad4f1297db49489e7e3b6bd49dfbbb2b6919cd2075a6285d71d6bde64834ced322af6bc14ee2b1503a65add7f3c48114edfc836202153bb9be'
            'e478213c464ea098ec3e90005292bd61fb8959feb75a58271416f766d9bc8319b010cf46136b07f30064ff34a8bcf31d99b074f8191c784f3edc28eb8a2320a2'
            '9fc25916ffa6536710016a313dfeab4a05de3d1a0818edb46a2e9c3c1eb850f82884383652e9ca1860c50ba6d4bab9cd818477606afffe522644f475ef22ba4b')

build() {
        echo "Please make sure you are building this package with jdk <= 8 set"
        cd "$pkgname/trunk/$pkgname/packaging/"

        ant
}

package() {
        


        mkdir -p "$pkgdir/usr/bin/" "$pkgdir/usr/share/icons" "$pkgdir/usr/share/java/$pkgname" 

        mv "$pkgname/trunk/$pkgname/packaging/${pkgname}Public-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"

        cp "$pkgname.jpg" "$pkgdir/usr/share/icons/$pkgname.jpg"

        cp "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
