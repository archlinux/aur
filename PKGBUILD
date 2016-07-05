# Maintainer: fzerorubigd <fzero@rubi.gd>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=pgcli
pkgver=1.1.0
pkgrel=2
pkgdesc="a command line interface for Postgres with auto-completion and syntax highlighting"
url="http://pgcli.com/"
arch=(any)
license=('BSD')
depends=('python' 'python-sqlparse' 'python-psycopg2' 'python-click' 'python-prompt_toolkit' 'python-humanize' 'python-configobj' 'python-pgspecial' )
makedepends=('python-distribute')
source=($pkgname-$pkgver.zip::https://github.com/dbcli/pgcli/archive/v$pkgver.zip)
provides=('pgcli')
conflicts=('pgcli-git')

package() {
    cd $srcdir/pgcli-${pkgver}
    python setup.py install --root=$pkgdir/ --optimize=1
    echo "#!/usr/bin/bash" > $pkgdir/usr/bin/pgcli
    echo "python -c 'import pgcli.main; pgcli.main.cli()' \"\$@\"" >> $pkgdir/usr/bin/pgcli
}
md5sums=('966633ae2488271e245ae0dd5f0a1730')
