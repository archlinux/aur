# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="superset-sup-git"
_pkgname="${pkgname/-git/}"
pkgver=v0.1.0.r8.ge35d2bd
pkgrel=1
pkgdesc="A modern CLI for Apache Superset and Preset workspaces "
arch=("any")
url="https://github.com/preset-io/superset-sup"
license=("BUSL-1.1")
depends=(
'cython'
'python-aiohttp'
'python-aiosignal'
'python-annotated-types'
'python-appdirs'
'python-async-timeout'
'python-attrs'
'python-backoff'
'python-beautifulsoup4'
'python-certifi'
'python-charset-normalizer'
'python-click'
'python-colorama'
'python-commonmark'
'python-frozenlist'
'python-greenlet'
'python-halo'
'python-idna'
'python-jinja'
'python-log-symbols'
'python-markupsafe'
'python-marshmallow'
'python-multidict'
'python-numpy'
'python-packaging'
'python-pandas'
'python-prison'
'python-prompt_toolkit'
'python-pydantic'
'python-pydantic-core'
'python-pydantic-settings'
'python-pygments'
'python-pyparsing'
'python-dateutil'
'python-dotenv'
'python-graphql-core'
'python-pytz'
'python-pyyaml'
'python-requests'
'python-rich'
'python-shellingham'
'python-six'
'python-soupsieve'
'python-spinners'
'python-sqlalchemy'
'python-sqlglot'
'python-tabulate'
'python-termcolor'
'python-typer'
'python-typing_extensions'
'python-typing-inspection'
'python-urllib3'
'python-wcwidth'
'python-websockets'
'python-yarl'
)
makedepends=("python-build" "python-packaging" "python-wheel" "python-installer")
source=("git+$url")
b2sums=('SKIP')

pkgver(){
 cd "$_pkgname"
 git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
 cd "$_pkgname"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_pkgname"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
