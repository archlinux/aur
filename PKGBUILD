pkgname=aichat-latest
pkgver=$(curl -s https://api.github.com/repos/sigoden/aichat/releases/latest | grep tag_name | awk -F"\"" '{print $4}')
pkgrel=1
pkgdesc="在终端中使用ai,支持OpenAI, Gemini, Claude, Mistral, Ollama, VertexAI, Ernie, Qianwen... 自动获取最新版本号，手动重新安装即可更新到最新版"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/sigoden/aichat"
license=('MIT' 'APACHE')
conflicts=('aichat' 'aichat-git' 'aichat-bin')

# for license
source_aarch64=("https://github.com/sigoden/aichat/releases/download/${pkgver}/aichat-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
source_x86_64=("https://github.com/sigoden/aichat/releases/download/${pkgver}/aichat-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_i686=("https://github.com/sigoden/aichat/releases/download/${pkgver}/aichat-${pkgver}-i686-unknown-linux-musl.tar.gz")
sha256sums_i686=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')


package() {
	find . -type f -name "aichat" -print -exec install -vDm755 {} -t $pkgdir/usr/bin/ \;
	find . -type f -name "LICENSE*" -print -exec install -vDm644 {} -t $pkgdir/usr/share/licenses/$pkgname/ \;
}

