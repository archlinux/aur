# Maintainer: Goldy <goldy@devgoldy.xyz>
# Maintainer: Ananas <ananas@ananas.moe>
pkgname=mov-cli
pkgver="4.4.19"
pkgrel=1
pkgdesc="Watch everything from your terminal."
arch=("x86_64" "i686")
url="https://github.com/mov-cli/mov-cli"
license=("MIT")
makedepends=(
	"python-build" "python-wheel" "python-installer"
)
depends=(
	"python"
	"python-beautifulsoup4"
	"python-httpx"
	"python-toml"
	"python-typer"
	"python-inquirer"
	"python-unidecode"
	"python-deprecation"
	"python-decouple"
	"python-thefuzz"
	"python-devgoldyutils"
	"python-mov-cli-test"

	"nano"
	"mpv"
	"fzf"
)
optdepends=(
	"python-lxml: For a faster beautifulsoup parser."

	"vlc: Optional media player."

	"ffmpeg: For downloading media"

	"yt-dlp"
)
checkdepends=()
provides=("mov-cli")
conflicts=("mov-cli-git")
md5sums=("SKIP")
source=(
	"https://github.com/mov-cli/mov-cli/archive/refs/tags/$pkgver.zip"
)

build() {
	cd $srcdir/$pkgname-$pkgver
	python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}