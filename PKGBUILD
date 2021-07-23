# Maintainer: RichieMay

pkgname=intellij-idea-ultimate-without-jbr
pkgver=2021.1.3
pkgrel=1
pkgdesc="Intellij Idea Ultimate Without Jbr"
arch=(x86_64)
options=(!strip)
url='https://www.jetbrains.com/idea/'
license=('GPL3')
depends=('java-environment>=11')
conflicts=('intellij-idea-ultimate-with-jbr' 'intellij-idea-ultimate-edition' 'intellij-idea-ultimate-edition-jre')

source=(
    # The download url
    "ideaIU-${pkgver}-no-jbr.tar.gz::https://download.jetbrains.com/idea/ideaIU-${pkgver}-no-jbr.tar.gz"
    "intellij-idea-ultimate.desktop")

sha256sums=(
    'd73e2266c85602f355179c53b72c6d7014c4d4e74437e25fe005f0f54d52878d'
    'a8a31e45e8abed10f71c3e948064fe7258dc9cb3d60d6f48de7b009b05625f88')


package() {
    _host_install_dir="/opt/$pkgname"
    _pkg_install_dir="${pkgdir}${_host_install_dir}"
    _pkg_bin_dir="$pkgdir/usr/bin"
    _pkg_png_dir="$pkgdir/usr/share/icons/hicolor/128x128/apps"
    _pkg_svg_dir="$pkgdir/usr/share/icons/hicolor/scalable/apps"
    _pkg_desktop_dir="$pkgdir/usr/share/applications"

    install -d "$_pkg_install_dir" "$_pkg_bin_dir" "$_pkg_png_dir" "$_pkg_svg_dir" "$_pkg_desktop_dir"

    cp -r idea-IU-*/* "$_pkg_install_dir"
    ln -s "$_host_install_dir/bin/idea.sh" "$_pkg_bin_dir/idea"
    ln -s "$_host_install_dir/bin/idea.png" "$_pkg_png_dir/idea.png"
    ln -s "$_host_install_dir/bin/idea.svg" "$_pkg_svg_dir/idea.svg"
    cp "$srcdir/intellij-idea-ultimate.desktop" "$_pkg_desktop_dir"
}
