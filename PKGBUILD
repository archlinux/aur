# Maintainer: fzerorubigd <fzero@rubi.gd>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=pgcli
pkgver=0.20.1
pkgrel=1
pkgdesc="a command line interface for Postgres with auto-completion and syntax highlighting"
url="http://pgcli.com/"
arch=(any)
license=('BSD')
depends=('python' 'python-sqlparse' 'python-psycopg2' 'python-click' 'python-prompt_toolkit' 'python-humanize' 'python-configobj' 'python-pgspecial' )
makedepends=('python-distribute')
source=($pkgname-$pkgver.zip::https://github.com/dbcli/pgcli/archive/v0.20.1.zip)
provides=('pgcli')
conflicts=('pgcli-git')

package() {
    cd $srcdir/pgcli
    python setup.py install --root=$pkgdir/ --optimize=1
    echo "#!/usr/bin/bash" > $pkgdir/usr/bin/pgcli
    echo "python -c 'import pgcli.main; pgcli.main.cli()' \"\$@\"" >> $pkgdir/usr/bin/pgcli
}
md5sums=('a2a8823993b472f0fae2a555229b6aca')
