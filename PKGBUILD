# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

_module="winecharm"
pkgname="python-${_module}"
pkgver="1.3"
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
sha256sums=("084d3b0f07b4fd2bc181a96be90f1439b39c762ce2503b2c86b8e4be3d81ccf2")
function build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}
function package() {
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
