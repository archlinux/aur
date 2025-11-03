# Maintainer: lilikoi <jamilbio20@gmail.com>
pkgname='chatgpt.sh'
pkgver=0.116.4
pkgrel=1
_commit=553c0b78d0db9c9b7bf61b31a690b86b5ea070c7
pkgdesc="Wrapper for ChatGPT, STT, and TTS. Features Ollama, Gemini, Anthropic, and more"
url='https://gitlab.com/fenixdragao/shellchatgpt'
arch=('any')
license=('GPL-3.0-or-later')
depends=('bash' 'curl' 'jq')
makedepends=('git')
optdepends=(
	'imagemagick: edit input images (fbida)'
	'xdg-utils: open images (xdg-open, open)'
	'sox: audio recorder (arecod, ffmpeg)'
	'mpv: audio player (sox, vlc, ffplay, afplay)'
	'xsel: copy output to clipboard (xclip)'
	'python: modules (tiktoken, markdown, bs4)'
	'bat: render markdown (pygmentize, glow, mdcat, mdless)'
	'w3m: dump URL text (lynx, elinks, links)'
	'poppler: dump PDF as text (gs, abiword, ebook-convert)'
	'libreoffice: dump doc files as text'
	'dialog: file picker (kdialog, zenity, vifm, ranger, nnn)'
	'yt-dlp: dump YouTube captions'
)
source=("${pkgname}-${pkgver}::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "man/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
	install -Dm644 "man/${pkgname}.txt" "$pkgdir/usr/share/doc/${pkgname}/${pkgname}.txt"
	install -Dm644 "man/${pkgname}.html" "$pkgdir/usr/share/doc/${pkgname}/${pkgname}.html"
	install -Dm644 ".chatgpt.conf" "$pkgdir/usr/share/doc/${pkgname}/chatgpt.conf"
	install -Dm644 "comp/bash/${pkgname}" "$pkgdir/usr/share/bash-completion/completions/${pkgname}"
	install -Dm644 "comp/zsh/_${pkgname}" "$pkgdir/usr/share/zsh/site-functions/_${pkgname}"
	install -Dm644 "man/README.md" "$pkgdir/usr/share/doc/${pkgname}/${pkgname}.md"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
