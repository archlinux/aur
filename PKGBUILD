# Maintainer: Yast <yastcher@gmail.com>
pkgname=tapeback-llm-local
pkgver=0.10.2
pkgrel=1
pkgdesc="Local LLM summaries for tapeback: llama.cpp's server, started for each summary"
arch=('any')
url="https://github.com/yastcher/tapeback"
license=('Apache-2.0')
depends=('tapeback-llm' 'llama-cpp')
optdepends=('ggml-cuda: run the model on an NVIDIA GPU'
            'ggml-vulkan: run the model on another GPU')

# Meta-package: tapeback-llm brings the OpenAI SDK the server is reached through,
# llama-cpp brings /usr/bin/llama-server. The model downloads on the first summary.

package() {
    install -Dm644 /dev/stdin "$pkgdir/usr/share/doc/$pkgname/README" <<DOC
tapeback-llm-local: local LLM summaries for tapeback.
Set TAPEBACK_LLM_PROVIDER=local; the model downloads on the first summary.
DOC
}
