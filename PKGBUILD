# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

_module="winecharm"
pkgname="python-${_module}"
pkgver="1.4"
_src_folder="WineCharm-${pkgver}"
pkgrel=1
pkgdesc="A Charming Wine GUI for managing Wine prefixes and applications"
url="https://github.com/fastrizwaan/WineCharm"
depends=(
    "python" "zenity" "wine" "winetricks" "perl-image-exiftool" "icoutils" "gnome-terminal"
    "wget" "zstd" "samba" "python-yaml" "python-psutil" "gtk4" "python-gobject" "xdg-utils"
    "procps-ng" "gtk3" "lib32-alsa-plugins" "lib32-libpulse" "lib32-openal" "python-polib"
)
makedepends=("python-build" "python-installer" "python-wheel")
license=("GPL-3.0-or-later")
arch=("any")
source=("https://github.com/fastrizwaan/WineCharm/archive/refs/tags/${pkgver}.zip")
sha256sums=('fca8eef215d60144f68e6336809c6852c105b797dfe7cde4e65f7923fb959b0d')
function build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}
function package() {
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
