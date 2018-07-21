# Maintainer: asm0dey <pavel.finkelshtein+AUR@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=pgcli
pkgver=1.10.1
pkgrel=1
pkgdesc="a command line interface for Postgres with auto-completion and syntax highlighting"
url="http://pgcli.com/"
arch=(any)
license=('BSD')
depends=('python' 'python-sqlparse' 'python-psycopg2' 'python-click' 'python-prompt_toolkit' 'python-humanize' 'python-configobj' 'python-pgspecial>=1.9.0' 'python-setproctitle' 'python-cli_helpers')
makedepends=('python-distribute')
source=($pkgname-$pkgver.zip::https://github.com/dbcli/pgcli/archive/v$pkgver.zip)
provides=('pgcli')
conflicts=('pgcli-git')

package() {
    cd "$srcdir/pgcli-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    cp LICENSE.txt "$_/LICENSE"
}
md5sums=('75c8883aa456f6c58adeed82d6c53131')
