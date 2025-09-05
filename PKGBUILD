# Maintainer: Reeshav Mainali <reeshavmainali12@gmail.com>
pkgname=pyprwall
pkgver=1.2
pkgrel=1
pkgdesc="A simple wallpaper manager for Hyprland that syncs wallpapers between hyprpaper and hyprlock."
arch=('x86_64')
url="https://github.com/reeshavmainali/pyprwall"
license=('GPL')

depends=(
    'python'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'hyprland'
    'hyprlock'
    'hyprpaper'
)

# Add the .desktop file to the source array
source=("${pkgname}.py" "${pkgname}.desktop")

# You will need to regenerate the checksums for both files
sha256sums=('6403182c11f68def13829daa01388ed1cd15b79cbbd4a8ee4e9769884141343e' '3bccc76b438a8cbc9427789c19dabfd39c380424a74fbcac9df063a992308787')

package() {
    # Install the Python script
    install -Dm755 "${srcdir}/${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
    
    # Install the .desktop file
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}