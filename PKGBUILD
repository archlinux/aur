_pkgname=dog-samurai
pkgname=${_pkgname}
pkgver=1.0.0
pkgrel=1
pkgdesc="Dog Samurai SDDM theme"
arch=('any')
url="https://github.com/Darkkal44/qylock/tree/main/themes/dog-samurai"
license=('GPL3')

depends=(
	"sddm"
	"qt6-declarative"
	"qt6-5compat"
	"qt6-svg"
	"qt6-multimedia"
	"qt6-multimedia-ffmpeg"
	"gst-plugins-base"
	"gst-plugins-good"
	"gst-plugins-bad"
	"gst-plugins-ugly"
	"fzf"
)

install=${pkgname}.install

source=("${_pkgname}::git+https://github.com/sidgwick/dog-samurai.git")
md5sums=('SKIP')

package() {
	# 目标安装路径
    local _dest="${pkgdir}/usr/share/sddm/themes/${_pkgname}"

    install -d "${_dest}"

    # 注意：使用本地 file:// 时,内容通常直接在 srcdir 下或以文件夹名呈现
    # 这里使用绝对路径引用更保险
    cp -r "${srcdir}/dog-samurai/theme/./" "${_dest}/"

    # 权限修正
    chmod -R 755 "${_dest}"
}
