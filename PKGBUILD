# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kevin Baxmann <kvbx@kvbx.de>
# Contributor: Arne Hoch <arne@derhoch.de>

pkgname=sqlcl
pkgver='23.4.0.023.2321'
pkgrel=1
pkgdesc='SQL Developer command line interface for Oracle'
arch=('any')
url='https://www.oracle.com/database/sqldeveloper/technologies/sqlcl'
license=('custom')
changelog=CHANGELOG.md
depends=('bash' 'java-runtime>=8')
source=("$pkgname-$pkgver.zip::https://download.oracle.com/otn_software/java/sqldeveloper/$pkgname-$pkgver.zip"
        "$pkgname.sh")
sha256sums=('f0adb2b8b60c248f5f15e0dc1e95876262316460b4ebf85e601116d73dad19ce'
            '34c5f2be48639dcd8ec9f38f950916a394ae399a0e583fbde4020acdccf951e0')

package() {
    install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "$pkgname/LICENSE.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 "$pkgname/THIRD-PARTY-LICENSES.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"

    rm "$pkgname"/{LICENSE.txt,THIRD-PARTY-LICENSES.txt,NOTICES.txt} "$pkgname"/bin/sql.exe

    install -d "$pkgdir/opt/$pkgname/"
    cp -a "$pkgname"/* "$pkgdir/opt/$pkgname/"
}
