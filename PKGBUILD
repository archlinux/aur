
# Maintainer: Mikata Riko <sanbikappa@qq.com>

pkgname=krita-plugin-pythonplugindevelopertools-git
pkgver=r40.aed2a21
pkgrel=1
epoch=
pkgdesc="Python plugin for Krita that assists with making python plugins for Krita"
arch=('any')
url="https://github.com/KnowZero/Krita-PythonPluginDeveloperTools"
license=('unknow')
depends=('krita' 'python-pyqt5')
provides=('krita-plugin-pythonplugindevelopertools' 'krita-plugin-pythonplugindevelopertools-bin')
conflicts=('krita-plugin-pythonplugindevelopertools' 'krita-plugin-pythonplugindevelopertools-bin')
install=.install
source=("git+https://github.com/KnowZero/Krita-PythonPluginDeveloperTools")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/Krita-PythonPluginDeveloperTools"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$srcdir/Krita-PythonPluginDeveloperTools"
    mkdir -p "$pkgdir/usr/share/krita/pykrita/"
    cp -r plugindevtools/{PluginDevTools,PluginDevTools.desktop} "$pkgdir/usr/share/krita/pykrita/"

}
