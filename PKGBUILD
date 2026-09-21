# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=navita
pkgver=2.3.11
pkgrel=1
pkgdesc="Fast directory navigation for Bash/Zsh with fuzzy search over history"
arch=('any')
url="https://github.com/CodesOfRishi/navita"
license=('Apache-2.0')
depends=('bash')
optdepends=('zsh: para usarlo tambien en zsh')
_tag="v2.3.11"
_srcdir="navita-2.3.11"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/CodesOfRishi/navita/tar.gz/refs/tags/$_tag")
sha256sums=('43e40800127a40ce73e0d3fdc0cb68cfd51ccff681df5d4d5645f892ae24856f')
function package() {
	cd "$_srcdir"
	install -Dm644 navita.sh "$pkgdir/usr/share/$pkgname/navita.sh"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
	install -d "$pkgdir/usr/share/doc/$pkgname"
	cat >"$pkgdir/usr/share/doc/$pkgname/README.txt" <<'EOF'
Para activar navita, agrega esta linea a tu ~/.bashrc o ~/.zshrc:

source /usr/share/navita/navita.sh

Por defecto reemplaza el comando `cd`. Configuralo con las variables de
entorno NAVITA_* (ver README del proyecto) ANTES de la linea `source`.
EOF

}
