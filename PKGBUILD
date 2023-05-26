# Maintainer: lilikoi <jamilbio20@gmail.com>
pkgname='chatgpt.sh'
pkgver=0.14.2
_commit=d2b584bdbc6ff121832ad5521b14a519b42726d3
pkgrel=1
pkgdesc='Shell wrapper for ChatGPT, DALL-E, Whisper, and awesome-chatgpt-prompts(-zh).'
url='https://github.com/mountaineerbr/shellChatGPT'
arch=('any')
license=('GPL3')
provides=('chatgpt.sh')
depends=('bash' 'curl' 'jq')
makedepends=('git')
optdepends=(
	'imagemagick: edit input images'
	'sox: audio record'
	'ffmpeg: audio record'
	'coreutils: wrap output at spaces (fold)'
	'xdg-utils: open images (xdg-open, open)'
	'xsel: copy output to clipboard'
	'xclip: copy output to clipboard'
	'python: count input tokens (tiktoken)'
)
source=("${pkgname}-${pkgver}::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "man/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
	install -Dm644 "man/${pkgname}.html" "$pkgdir/usr/share/doc/${pkgname}/${pkgname}.html"
	install -Dm644 "man/README.md" "$pkgdir/usr/share/doc/${pkgname}/${pkgname}.md"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm644 ".chatgpt.conf" "$pkgdir/usr/share/doc/${pkgname}/chatgpt.conf"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
