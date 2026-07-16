# Maintainer: Hannah R. <git@rennersh.de>

pkgname=noctalia-plugin-screenshot-ocr
pkgver=1.0.0
pkgrel=1
pkgdesc="Noctalia Shell screenshot OCR plugin powered by Mistral OCR"
arch=('any')
url="https://github.com/MartianInGreen/noctalia-screenshot-ocr"
license=('MIT')
depends=('bash' 'curl' 'grim' 'jq' 'noctalia-shell>=4.0.0' 'slurp' 'wl-clipboard')
optdepends=('imagemagick: resize large screenshots before OCR')
_source_url="https://raw.githubusercontent.com/MartianInGreen/noctalia-screenshot-ocr/v${pkgver}"
source=("BarWidget.qml::$_source_url/BarWidget.qml"
        "PluginSettings.qml::$_source_url/PluginSettings.qml"
        "manifest.json::$_source_url/manifest.json"
        "README.md::$_source_url/README.md"
        "screenshot-ocr.sh::$_source_url/scripts/screenshot-ocr.sh"
        "LICENSE::$_source_url/LICENSE")
sha256sums=('80a8a8b46e41e13b5fa09cdf17d01e74929438267b2ff05aa1058e4a2eef6f1a'
            '65c2492060e0603ee55bd7b7ae83ffdbcb7aaa86f04374a398f2d5ba5ae63d58'
            '31d69e704fe2845aab0adb1be965a2b05a93b1d76a72472772e9cbd84756fd60'
            '0d5ed3b202cac1dbc8048f19351f1831af0793714c0d29210dcd2e77a876e9c5'
            '6b36c235d461703b4adfd15664f13d9410d89551271a15204937dd7cfcf08a22'
            '3afa37d3b9e20561118f1bccc10ed6e17ec9b76270a228d7f8794e4a5e132eab')

package() {
  local plugin_dir="$pkgdir/usr/share/noctalia/plugins/screenshot-ocr"

  install -Dm644 BarWidget.qml "$plugin_dir/BarWidget.qml"
  install -Dm644 PluginSettings.qml "$plugin_dir/PluginSettings.qml"
  install -Dm644 manifest.json "$plugin_dir/manifest.json"
  install -Dm644 README.md "$plugin_dir/README.md"
  install -Dm755 screenshot-ocr.sh "$plugin_dir/scripts/screenshot-ocr.sh"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
