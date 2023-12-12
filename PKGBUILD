# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=(otf-geist otf-geist-mono)
pkgbase=otf-geist-fonts
pkgver=1.1.0
pkgrel=1
pkgdesc='A new font family for Vercel, created by Vercel in collaboration with Basement Studio'
arch=(any)
url=""
license=(OFL)
source=("https://github.com/vercel/geist-font/releases/download/$pkgver/Geist.zip"
        "https://github.com/vercel/geist-font/releases/download/$pkgver/Geist.Mono.zip"
        "https://raw.githubusercontent.com/vercel/geist-font/$pkgver/LICENSE.TXT")
sha256sums=('8f96b6e69f416706cec3293ceaa4cbb41a981cba7a32ed7c92dff14a5a44497e'
            'b32e99aa5b5e7828457ce8808e8551a859089aa48d745f1b99b5a43d90dee940'
            'f38cbd54a72dd027dc854a9bbac9eb5bb8b9b1d6e4b43f037435336ab62a63fc')

_geist_files=(Geist-Black.otf
              Geist-Bold.otf
              Geist-Light.otf
              Geist-Medium.otf
              Geist-Regular.otf
              Geist-SemiBold.otf
              Geist-Thin.otf
              Geist-UltraBlack.otf
              Geist-UltraLight.otf
              GeistVariableVF.ttf
              GeistVariableVF.woff2)

_geist_mono_files=(GeistMono-Black.otf
                   GeistMono-Bold.otf
                   GeistMono-Light.otf
                   GeistMono-Medium.otf
                   GeistMono-Regular.otf
                   GeistMono-SemiBold.otf
                   GeistMono-Thin.otf
                   GeistMono-UltraBlack.otf
                   GeistMono-UltraLight.otf
                   GeistMonoVariableVF.ttf
                   GeistMonoVariableVF.woff2)

package_otf-geist() {
	url='https://vercel.com/font'

	for f in ${_geist_files[@]}
	do
		install -Dm644 "$f" -t "$pkgdir/usr/share/fonts/Geist"
	done
	install -Dm644 LICENSE.TXT -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_otf-geist-mono() {
	url='https://vercel.com/font/mono'

	for f in ${_geist_mono_files[@]}
	do
		install -Dm644 "$f" -t "$pkgdir/usr/share/fonts/GeistMono"
	done
	install -Dm644 LICENSE.TXT -t "$pkgdir/usr/share/licenses/$pkgname"
}
