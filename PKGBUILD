# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
pkgver=78.0a1.20200522
_pkgver=78.0a1
pkgrel=1
pkgdesc="Language pack for Firefox Nightly"
arch=('any')
license=(MPL GPL LGPL)
url="https://www.mozilla.org/firefox/"
provides=("$pkgbase=$pkgver-$pkgrel")
depends=("firefox-nightly>=$pkgver")

_languages=(
  'ach    "Acholi"'
  'af     "Afrikaans"'
  'an     "Aragonese"'
  'ar     "Arabic"'
  'ast    "Asturian"'
  'az     "Azerbaijani"'
  'be     "Belarusian"'
  'bg     "Bulgarian"'
  'bn     "Bengali"'
  'br     "Breton"'
  'bs     "Bosnian"'
  'ca-valencia "Catalan (Valencian)"'
  'ca     "Catalan"'
  'cak    "Maya Kaqchikel"'
  'cs     "Czech"'
  'cy     "Welsh"'
  'da     "Danish"'
  'de     "German"'
  'dsb    "Lower Sorbian"'
  'el     "Greek"'
  'en-CA  "English (Canadian)"'
  'en-GB  "English (British)"'
  'eo     "Esperanto"'
  'es-AR  "Spanish (Argentina)"'
  'es-CL  "Spanish (Chile)"'
  'es-ES  "Spanish (Spain)"'
  'es-MX  "Spanish (Mexico)"'
  'et     "Estonian"'
  'eu     "Basque"'
  'fa     "Persian"'
  'ff     "Fulah"'
  'fi     "Finnish"'
  'fr     "French"'
  'fy-NL  "Frisian"'
  'ga-IE  "Irish"'
  'gd     "Gaelic (Scotland)"'
  'gl     "Galician"'
  'gn     "Guarani"'
  'gu-IN  "Gujarati (India)"'
  'he     "Hebrew"'
  'hi-IN  "Hindi (India)"'
  'hr     "Croatian"'
  'hsb    "Upper Sorbian"'
  'hu     "Hungarian"'
  'hy-AM  "Armenian"'
  'ia     "Interlingua"'
  'id     "Indonesian"'
  'is     "Icelandic"'
  'it     "Italian"'
  'ja     "Japanese"'
  'ka     "Georgian"'
  'kab    "Kabyle"'
  'kk     "Kazakh"'
  'km     "Khmer"'
  'kn     "Kannada"'
  'ko     "Korean"'
  'lij    "Ligurian"'
  'lt     "Lithuanian"'
  'lv     "Latvian"'
  'mk     "Macedonian"'
  'mr     "Marathi"'
  'ms     "Malay"'
  'my     "Burmese"'
  'nb-NO  "Norwegian (Bokmål)"'
  'ne-NP  "Nepali"'
  'nl     "Dutch"'
  'nn-NO  "Norwegian (Nynorsk)"'
  'oc     "Occitan"'
  'pa-IN  "Punjabi (India)"'
  'pl     "Polish"'
  'pt-BR  "Portuguese (Brazilian)"'
  'pt-PT  "Portuguese (Portugal)"'
  'rm     "Romansh"'
  'ro     "Romanian"'
  'ru     "Russian"'
  'si     "Sinhala"'
  'sk     "Slovak"'
  'sl     "Slovenian"'
  'son    "Songhai"'
  'sq     "Albanian"'
  'sr     "Serbian"'
  'sv-SE  "Swedish"'
  'ta     "Tamil"'
  'te     "Telugu"'
  'th     "Thai"'
  'tl     "Tagalog"'
  'tr     "Turkish"'
  'trs    "Chicahuaxtla Triqui"'
  'uk     "Ukrainian"'
  'ur     "Urdu"'
  'uz     "Uzbek"'
  'vi     "Vietnamese"'
  'xh     "Xhosa"'
  'zh-CN  "Chinese (Simplified)"'
  'zh-TW  "Chinese (Traditional)"'
)

pkgname=()
source=()
_url=https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-nightly-i18n-${_locale,,}

  pkgname+=($_pkgname)
  source+=("firefox-i18n-$_pkgver-$_locale.xpi::$_url/firefox-$_pkgver.$_locale.langpack.xpi")
  eval "package_$_pkgname() {
    _package $_lang
  }"
done

# Don't extract anything
noextract=("${source[@]%%::*}")

package_firefox-beta-i18n-all() {
  pkgdesc="All language packs for Firefox Beta (meta)"
  depends=("${_all_depends[@]}")
}

_package() {
  pkgdesc="${_languages["$1"]} language pack for Firefox Beta"
  provides+=("firefox-i18n-$_as_lower" "firefox-developer-edition-i18n-$_as_lower")
  conflicts=("firefox-i18n-$_as_lower" "firefox-developer-edition-i18n-$_as_lower")

  install -Dm644 "firefox-i18n-$pkgver-$1.xpi" \
      "$pkgdir/opt/firefox-nightly/browser/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

sha256sums=(
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)
