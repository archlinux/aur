# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Dieter Hsu <xlk1982@gmail.com>

pkgname=eclipse-markdown
pkgver=1.1.0
pkgrel=2
pkgdesc="Markdown editor plugin for Eclipse - outline, folding, formatting, HTML export & preview"
arch=('any')
url="http://www.winterwell.com/software/markdown-editor.php"
license=('GPL2')
depends=('eclipse')
source=("http://dl.bintray.com/enide/Markdown/${pkgver}/plugins/winterwell.markdown_${pkgver}.201402240523.jar"
    "http://dl.bintray.com/enide/Markdown/${pkgver}/features/markdown.editor.feature_${pkgver}.201402240523.jar")
md5sums=('9882437e6360d25fc097218a8264a988'
         '478b7d11c9d22d10d814e1067593dc2d')

package() {
    _dest="$pkgdir/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse"
    mkdir -p $_dest/{plugins,features}
    install -Dm644 winterwell.markdown_$pkgver.201402240523.jar $_dest/plugins/winterwell.markdown_$pkgver.201402240523.jar
    install -Dm644 markdown.editor.feature_$pkgver.201402240523.jar $_dest/features/markdown.editor.feature_$pkgver.201402240523.jar
}
