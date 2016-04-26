# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>
pkgname="pdf-xchange"
pkgver="6.0.317.1"
pkgrel="1"
pkgdesc="Feature-rich PDF editor/viewer. Create, view, edit and annotate plus much more."
license=('Custom')
arch=('i686' 'x86_64')
depends=('wine' 'hicolor-icon-theme')
makedepends=('p7zip' 'icoutils' 'gendesk')
install=pdf-xchange.install
url="http://www.tracker-software.com/product/pdf-xchange-editor"
_downloadsource="http://www.tracker-software.com/downloads"
_x86file="EditorV6.x86.msi"
_x64file="EditorV6.x64.msi"
_installdir="/usr/lib"

 source_x86_64+=($_downloadsource/$_x64file)
 md5sums_x86_64+=(5d3039d213a7ce0ca9da9260e3ac2d61)

 source_i686+=($_downloadsource/$_x86file)
 md5sums_i686+=(6eefc5f1629d9cb76e3283114453f089)

prepare()
{

 if [ "$CARCH" == "x86_64" ]; then
	7z x "$srcdir/$_x64file" -o"$srcdir"
	7z x "$srcdir/et_x64.cab" -o"$srcdir"
	7z x "$srcdir/e_x64.cab" -o"$srcdir"
			
 fi
 if [ "$CARCH" == "i686" ]; then	
	7z x "$srcdir/$_x86file" -o"$srcdir"
	7z x "$srcdir/et_bin.cab" -o"$srcdir"
        7z x "$srcdir/e_bin.cab" -o"$srcdir"
 fi

 7z x "$srcdir/et_res.cab" -o"$srcdir"
 7z x "$srcdir/e_res.cab" -o"$srcdir"
 7z x "$srcdir/disk1.cab" -o"$srcdir"

}

package()
{  

 mkdir -p "$pkgdir${_installdir}/$pkgname"

 install -Dm644 "$srcdir/FID_SD_OXT_de" "$pkgdir${_installdir}/$pkgname/Dictionaries/dict-de.oxt"
 install -Dm644 "$srcdir/FID_SD_OXT_en" "$pkgdir${_installdir}/$pkgname/Dictionaries/dict-en.oxt"
 install -Dm644 "$srcdir/FID_SD_OXT_es" "$pkgdir${_installdir}/$pkgname/Dictionaries/dict-es.oxt"
 install -Dm644 "$srcdir/FID_SD_OXT_fr" "$pkgdir${_installdir}/$pkgname/Dictionaries/dict-fr.oxt"
 install -Dm644 "$srcdir/FID_SD_OXT_ru" "$pkgdir${_installdir}/$pkgname/Dictionaries/dict-ru.oxt"
 install -Dm644 "$srcdir/FID_SD_OXT_uk" "$pkgdir${_installdir}/$pkgname/Dictionaries/dict-uk.oxt"
 install -Dm644 "$srcdir/FID_SD_GPLv2" "$pkgdir${_installdir}/$pkgname/Dictionaries/GPLv2.txt"
 install -Dm644 "$srcdir/FID_SD_GPLv3" "$pkgdir${_installdir}/$pkgname/Dictionaries/GPLv3.txt"

 install -Dm644 "$srcdir/FID_HelpStub" "$pkgdir${_installdir}/$pkgname/Help/PDFXVE6Sm.pdf"

 install -Dm644 "$srcdir/FID_PDFA_uk_UA" "$pkgdir${_installdir}/$pkgname/Languages/PDFAConverter.uk-UA.xcl"
 install -Dm644 "$srcdir/FID_OPT_zh_TW" "$pkgdir${_installdir}/$pkgname/Languages/PDFOptimizer.zh-TW.xcl"
 install -Dm644 "$srcdir/FID_FO_fy_NL" "$pkgdir${_installdir}/$pkgname/Languages/FileOpenSH.fy-NL.xcl"
 install -Dm644 "$srcdir/FID_FO_es_ES" "$pkgdir${_installdir}/$pkgname/Languages/FileOpenSH.es-ES.xcl"
 install -Dm644 "$srcdir/FID_FO_de_DE" "$pkgdir${_installdir}/$pkgname/Languages/FileOpenSH.de-DE.xcl"
 install -Dm644 "$srcdir/FID_FO_cs_CZ" "$pkgdir${_installdir}/$pkgname/Languages/FileOpenSH.cs-CZ.xcl"
 install -Dm644 "$srcdir/FID_FO_nl_NL" "$pkgdir${_installdir}/$pkgname/Languages/FileOpenSH.nl-NL.xcl"
 install -Dm644 "$srcdir/FID_FO_pt_PT" "$pkgdir${_installdir}/$pkgname/Languages/FileOpenSH.pt-PT.xcl"
 install -Dm644 "$srcdir/FID_FO_it_IT" "$pkgdir${_installdir}/$pkgname/Languages/FileOpenSH.it-IT.xcl"
 install -Dm644 "$srcdir/FID_ROL_sv_SE"	"$pkgdir${_installdir}/$pkgname/Languages/ReadOutLoud.sv-SE.xcl"
 install -Dm644 "$srcdir/FID_ROL_fi_FI" "$pkgdir${_installdir}/$pkgname/Languages/ReadOutLoud.fi-FI.xcl"
 install -Dm644 "$srcdir/FID_ROL_da_DK"	"$pkgdir${_installdir}/$pkgname/Languages/ReadOutLoud.da-DK.xcl"
 install -Dm644 "$srcdir/FID_ROL_zh_CN"	"$pkgdir${_installdir}/$pkgname/Languages/ReadOutLoud.zh-CN.xcl"
 install -Dm644 "$srcdir/FID_ROL_it_IT"	"$pkgdir${_installdir}/$pkgname/Languages/ReadOutLoud.it-IT.xcl"
 install -Dm644 "$srcdir/FID_ROL_zh_TW"	"$pkgdir${_installdir}/$pkgname/Languages/ReadOutLoud.zh-TW.xcl"
 install -Dm644 "$srcdir/FID_ROL_tr_TR"	"$pkgdir${_installdir}/$pkgname/Languages/ReadOutLoud.tr-TR.xcl"
 install -Dm644 "$srcdir/FID_ROL_fy_NL"	"$pkgdir${_installdir}/$pkgname/Languages/ReadOutLoud.fy-NL.xcl"
 install -Dm644 "$srcdir/FID_ROL_sk_SK"	"$pkgdir${_installdir}/$pkgname/Languages/ReadOutLoud.sk-SK.xcl"
 install -Dm644 "$srcdir/FID_ROL_cs_CZ"	"$pkgdir${_installdir}/$pkgname/Languages/ReadOutLoud.cs-CZ.xcl"
 install -Dm644 "$srcdir/FID_ROL_de_DE"	"$pkgdir${_installdir}/$pkgname/Languages/ReadOutLoud.de-DE.xcl"
 install -Dm644 "$srcdir/FID_ROL_nl_NL"	"$pkgdir${_installdir}/$pkgname/Languages/ReadOutLoud.nl-NL.xcl"
 install -Dm644 "$srcdir/FID_ROL_he_IL"	"$pkgdir${_installdir}/$pkgname/Languages/ReadOutLoud.he-IL.xcl"
 install -Dm644 "$srcdir/FID_ROL_pl_PL"	"$pkgdir${_installdir}/$pkgname/Languages/ReadOutLoud.pl-PL.xcl"
 install -Dm644 "$srcdir/FID_ROL_fr_CH"	"$pkgdir${_installdir}/$pkgname/Languages/ReadOutLoud.fr-CH.xcl"
 install -Dm644 "$srcdir/FID_ROL_es_ES"	"$pkgdir${_installdir}/$pkgname/Languages/ReadOutLoud.es-ES.xcl"
 install -Dm644 "$srcdir/FID_ROL_ko_KR"	"$pkgdir${_installdir}/$pkgname/Languages/ReadOutLoud.ko-KR.xcl"
 install -Dm644 "$srcdir/FID_ROL_pt_PT"	"$pkgdir${_installdir}/$pkgname/Languages/ReadOutLoud.pt-PT.xcl"
 install -Dm644 "$srcdir/FID_ROL_fr_FR"	"$pkgdir${_installdir}/$pkgname/Languages/ReadOutLoud.fr-FR.xcl"
 install -Dm644 "$srcdir/FID_SPL_zh_TW" "$pkgdir${_installdir}/$pkgname/Languages/SpellChecker.zh-TW.xcl"
 install -Dm644 "$srcdir/FID_SPL_da_DK" "$pkgdir${_installdir}/$pkgname/Languages/SpellChecker.da-DK.xcl"
 install -Dm644 "$srcdir/FID_SPL_tr_TR" "$pkgdir${_installdir}/$pkgname/Languages/SpellChecker.tr-TR.xcl"
 install -Dm644 "$srcdir/FID_CONV_nl_NL" "$pkgdir${_installdir}/$pkgname/Languages/PDFConverter.nl-NL.xcl"
 install -Dm644 "$srcdir/FID_ROL_ja_JP" "$pkgdir${_installdir}/$pkgname/Languages/ReadOutLoud.ja-JP.xcl"
 install -Dm644 "$srcdir/FID_ROL_uk_UA" "$pkgdir${_installdir}/$pkgname/Languages/ReadOutLoud.uk-UA.xcl"
 install -Dm644 "$srcdir/FID_ROL_ru_RU" "$pkgdir${_installdir}/$pkgname/Languages/ReadOutLoud.ru-RU.xcl"
 install -Dm644 "$srcdir/FID_SPL_zh_CN" "$pkgdir${_installdir}/$pkgname/Languages/SpellChecker.zh-CN.xcl"
 install -Dm644 "$srcdir/FID_SPL_he_IL" "$pkgdir${_installdir}/$pkgname/Languages/SpellChecker.he-IL.xcl"
 install -Dm644 "$srcdir/FID_SPL_fr_CH" "$pkgdir${_installdir}/$pkgname/Languages/SpellChecker.fr-CH.xcl"
 install -Dm644 "$srcdir/FID_SPL_ko_KR" "$pkgdir${_installdir}/$pkgname/Languages/SpellChecker.ko-KR.xcl"
 install -Dm644 "$srcdir/FID_SPL_fy_NL" "$pkgdir${_installdir}/$pkgname/Languages/SpellChecker.fy-NL.xcl"
 install -Dm644 "$srcdir/FID_SPL_pl_PL" "$pkgdir${_installdir}/$pkgname/Languages/SpellChecker.pl-PL.xcl"
 install -Dm644 "$srcdir/FID_SPL_cs_CZ" "$pkgdir${_installdir}/$pkgname/Languages/SpellChecker.cs-CZ.xcl"
 install -Dm644 "$srcdir/FID_SPL_fi_FI" "$pkgdir${_installdir}/$pkgname/Languages/SpellChecker.fi-FI.xcl"
 install -Dm644 "$srcdir/FID_SPL_sk_SK" "$pkgdir${_installdir}/$pkgname/Languages/SpellChecker.sk-SK.xcl"
 install -Dm644 "$srcdir/FID_SPL_it_IT" "$pkgdir${_installdir}/$pkgname/Languages/SpellChecker.it-IT.xcl"
 install -Dm644 "$srcdir/FID_SPL_nl_NL" "$pkgdir${_installdir}/$pkgname/Languages/SpellChecker.nl-NL.xcl"
 install -Dm644 "$srcdir/FID_SPL_de_DE" "$pkgdir${_installdir}/$pkgname/Languages/SpellChecker.de-DE.xcl"
 install -Dm644 "$srcdir/FID_SPL_fr_FR" "$pkgdir${_installdir}/$pkgname/Languages/SpellChecker.fr-FR.xcl"
 install -Dm644 "$srcdir/FID_SPL_ja_JP" "$pkgdir${_installdir}/$pkgname/Languages/SpellChecker.ja-JP.xcl"
 install -Dm644 "$srcdir/FID_SPL_es_ES" "$pkgdir${_installdir}/$pkgname/Languages/SpellChecker.es-ES.xcl"
 install -Dm644 "$srcdir/FID_SPL_pt_PT" "$pkgdir${_installdir}/$pkgname/Languages/SpellChecker.pt-PT.xcl"
 install -Dm644 "$srcdir/FID_SPL_uk_UA" "$pkgdir${_installdir}/$pkgname/Languages/SpellChecker.uk-UA.xcl"
 install -Dm644 "$srcdir/FID_SPL_ru_RU" "$pkgdir${_installdir}/$pkgname/Languages/SpellChecker.ru-RU.xcl"
 install -Dm644 "$srcdir/FID_OCR_fy_NL" "$pkgdir${_installdir}/$pkgname/Languages/OCRPlugin.fy-NL.xcl"
 install -Dm644 "$srcdir/FID_OCR_fi_FI" "$pkgdir${_installdir}/$pkgname/Languages/OCRPlugin.fi-FI.xcl"
 install -Dm644 "$srcdir/FID_OCR_nl_NL" "$pkgdir${_installdir}/$pkgname/Languages/OCRPlugin.nl-NL.xcl"
 install -Dm644 "$srcdir/FID_OCR_cs_CZ" "$pkgdir${_installdir}/$pkgname/Languages/OCRPlugin.cs-CZ.xcl"
 install -Dm644 "$srcdir/FID_OCR_de_DE" "$pkgdir${_installdir}/$pkgname/Languages/OCRPlugin.de-DE.xcl"
 install -Dm644 "$srcdir/FID_OCR_it_IT" "$pkgdir${_installdir}/$pkgname/Languages/OCRPlugin.it-IT.xcl"
 install -Dm644 "$srcdir/FID_DB_cs_CZ" "$pkgdir${_installdir}/$pkgname/Languages/DropBox.cs-CZ.xcl"
 install -Dm644 "$srcdir/FID_DB_de_DE" "$pkgdir${_installdir}/$pkgname/Languages/DropBox.de-DE.xcl"
 install -Dm644 "$srcdir/FID_CONV_cs_CZ" "$pkgdir${_installdir}/$pkgname/Languages/PDFConverter.cs-CZ.xcl"
 install -Dm644 "$srcdir/FID_OCR_sv_SE" "$pkgdir${_installdir}/$pkgname/Languages/OCRPlugin.sv-SE.xcl"
 install -Dm644 "$srcdir/FID_OCR_uk_UA" "$pkgdir${_installdir}/$pkgname/Languages/OCRPlugin.uk-UA.xcl"
 install -Dm644 "$srcdir/FID_CONV_de_DE" "$pkgdir${_installdir}/$pkgname/Languages/PDFConverter.de-DE.xcl"
 install -Dm644 "$srcdir/FID_OCR_ru_RU" "$pkgdir${_installdir}/$pkgname/Languages/OCRPlugin.ru-RU.xcl"
 install -Dm644 "$srcdir/FID_CONV_it_IT" "$pkgdir${_installdir}/$pkgname/Languages/PDFConverter.it-IT.xcl"
 install -Dm644 "$srcdir/FID_DB_ru_RU" "$pkgdir${_installdir}/$pkgname/Languages/DropBox.ru-RU.xcl"
 install -Dm644 "$srcdir/FID_DB_uk_UA" "$pkgdir${_installdir}/$pkgname/Languages/DropBox.uk-UA.xcl"
 install -Dm644 "$srcdir/FID_OCR_da_DK" "$pkgdir${_installdir}/$pkgname/Languages/OCRPlugin.da-DK.xcl"
 install -Dm644 "$srcdir/FID_OCR_zh_TW" "$pkgdir${_installdir}/$pkgname/Languages/OCRPlugin.zh-TW.xcl"
 install -Dm644 "$srcdir/FID_OCR_tr_TR" "$pkgdir${_installdir}/$pkgname/Languages/OCRPlugin.tr-TR.xcl"
 install -Dm644 "$srcdir/FID_CONV_uk_UA" "$pkgdir${_installdir}/$pkgname/Languages/PDFConverter.uk-UA.xcl"
 install -Dm644 "$srcdir/FID_CONV_ru_RU" "$pkgdir${_installdir}/$pkgname/Languages/PDFConverter.ru-RU.xcl"
 install -Dm644 "$srcdir/FID_OCR_zh_CN" "$pkgdir${_installdir}/$pkgname/Languages/OCRPlugin.zh-CN.xcl"
 install -Dm644 "$srcdir/FID_OCR_sk_SK" "$pkgdir${_installdir}/$pkgname/Languages/OCRPlugin.sk-SK.xcl"
 install -Dm644 "$srcdir/FID_OCR_pl_PL" "$pkgdir${_installdir}/$pkgname/Languages/OCRPlugin.pl-PL.xcl"
 install -Dm644 "$srcdir/FID_OCR_he_IL" "$pkgdir${_installdir}/$pkgname/Languages/OCRPlugin.he-IL.xcl"
 install -Dm644 "$srcdir/FID_OCR_ko_KR" "$pkgdir${_installdir}/$pkgname/Languages/OCRPlugin.ko-KR.xcl"
 install -Dm644 "$srcdir/FID_OCR_pt_PT" "$pkgdir${_installdir}/$pkgname/Languages/OCRPlugin.pt-PT.xcl"
 install -Dm644 "$srcdir/FID_OCR_fr_FR" "$pkgdir${_installdir}/$pkgname/Languages/OCRPlugin.fr-FR.xcl"
 install -Dm644 "$srcdir/FID_OCR_es_ES" "$pkgdir${_installdir}/$pkgname/Languages/OCRPlugin.es-ES.xcl"
 install -Dm644 "$srcdir/FID_OCR_fr_CH" "$pkgdir${_installdir}/$pkgname/Languages/OCRPlugin.fr-CH.xcl"
 install -Dm644 "$srcdir/FID_OCR_ja_JP" "$pkgdir${_installdir}/$pkgname/Languages/OCRPlugin.ja-JP.xcl"
 install -Dm644 "$srcdir/FID_SP_cs_CZ" "$pkgdir${_installdir}/$pkgname/Languages/SharePoint.cs-CZ.xcl"
 install -Dm644 "$srcdir/FID_SP_nl_NL" "$pkgdir${_installdir}/$pkgname/Languages/SharePoint.nl-NL.xcl"
 install -Dm644 "$srcdir/FID_SP_fy_NL" "$pkgdir${_installdir}/$pkgname/Languages/SharePoint.fy-NL.xcl"
 install -Dm644 "$srcdir/FID_PDFA_es_ES" "$pkgdir${_installdir}/$pkgname/Languages/PDFAConverter.es-ES.xcl"
 install -Dm644 "$srcdir/FID_SP_de_DE" "$pkgdir${_installdir}/$pkgname/Languages/SharePoint.de-DE.xcl"
 install -Dm644 "$srcdir/FID_SP_it_IT" "$pkgdir${_installdir}/$pkgname/Languages/SharePoint.it-IT.xcl"
 install -Dm644 "$srcdir/FID_SP_es_ES" "$pkgdir${_installdir}/$pkgname/Languages/SharePoint.es-ES.xcl"
 install -Dm644 "$srcdir/FID_SP_ru_RU" "$pkgdir${_installdir}/$pkgname/Languages/SharePoint.ru-RU.xcl"
 install -Dm644 "$srcdir/FID_BKM_zh_TW" "$pkgdir${_installdir}/$pkgname/Languages/Bookmarks.zh-TW.xcl"
 install -Dm644 "$srcdir/FID_OPT_fi_FI" "$pkgdir${_installdir}/$pkgname/Languages/PDFOptimizer.fi-FI.xcl"
 install -Dm644 "$srcdir/FID_OPT_nl_NL" "$pkgdir${_installdir}/$pkgname/Languages/PDFOptimizer.nl-NL.xcl"
 install -Dm644 "$srcdir/FID_OPT_pl_PL" "$pkgdir${_installdir}/$pkgname/Languages/PDFOptimizer.pl-PL.xcl"
 install -Dm644 "$srcdir/FID_OPT_fy_NL" "$pkgdir${_installdir}/$pkgname/Languages/PDFOptimizer.fy-NL.xcl"
 install -Dm644 "$srcdir/FID_OPT_sk_SK" "$pkgdir${_installdir}/$pkgname/Languages/PDFOptimizer.sk-SK.xcl"
 install -Dm644 "$srcdir/FID_OPT_de_DE" "$pkgdir${_installdir}/$pkgname/Languages/PDFOptimizer.de-DE.xcl"
 install -Dm644 "$srcdir/FID_OPT_cs_CZ" "$pkgdir${_installdir}/$pkgname/Languages/PDFOptimizer.cs-CZ.xcl"
 install -Dm644 "$srcdir/FID_OPT_es_ES" "$pkgdir${_installdir}/$pkgname/Languages/PDFOptimizer.es-ES.xcl"
 install -Dm644 "$srcdir/FID_OPT_fr_FR" "$pkgdir${_installdir}/$pkgname/Languages/PDFOptimizer.fr-FR.xcl"
 install -Dm644 "$srcdir/FID_OPT_pt_PT" "$pkgdir${_installdir}/$pkgname/Languages/PDFOptimizer.pt-PT.xcl"
 install -Dm644 "$srcdir/FID_OPT_it_IT" "$pkgdir${_installdir}/$pkgname/Languages/PDFOptimizer.it-IT.xcl"
 install -Dm644 "$srcdir/FID_BKM_fr_FR" "$pkgdir${_installdir}/$pkgname/Languages/Bookmarks.fr-FR.xcl"
 install -Dm644 "$srcdir/FID_OPT_ja_JP" "$pkgdir${_installdir}/$pkgname/Languages/PDFOptimizer.ja-JP.xcl"
 install -Dm644 "$srcdir/FID_OPT_uk_UA" "$pkgdir${_installdir}/$pkgname/Languages/PDFOptimizer.uk-UA.xcl"
 install -Dm644 "$srcdir/FID_OPT_ru_RU" "$pkgdir${_installdir}/$pkgname/Languages/PDFOptimizer.ru-RU.xcl"
 install -Dm644 "$srcdir/FID_PDFA_pt_PT" "$pkgdir${_installdir}/$pkgname/Languages/PDFAConverter.pt-PT.xcl"
 install -Dm644 "$srcdir/FID_PDFA_nl_NL" "$pkgdir${_installdir}/$pkgname/Languages/PDFAConverter.nl-NL.xcl"
 install -Dm644 "$srcdir/FID_PDFA_fy_NL" "$pkgdir${_installdir}/$pkgname/Languages/PDFAConverter.fy-NL.xcl"
 install -Dm644 "$srcdir/FID_PDFA_cs_CZ" "$pkgdir${_installdir}/$pkgname/Languages/PDFAConverter.cs-CZ.xcl"
 install -Dm644 "$srcdir/FID_PDFA_de_DE" "$pkgdir${_installdir}/$pkgname/Languages/PDFAConverter.de-DE.xcl"
 install -Dm644 "$srcdir/FID_PDFA_it_IT" "$pkgdir${_installdir}/$pkgname/Languages/PDFAConverter.it-IT.xcl"
 install -Dm644 "$srcdir/FID_BKM_pl_PL" "$pkgdir${_installdir}/$pkgname/Languages/Bookmarks.pl-PL.xcl"
 install -Dm644 "$srcdir/FID_BKM_zh_CN" "$pkgdir${_installdir}/$pkgname/Languages/Bookmarks.zh-CN.xcl"
 install -Dm644 "$srcdir/FID_BKM_sk_SK" "$pkgdir${_installdir}/$pkgname/Languages/Bookmarks.sk-SK.xcl"
 install -Dm644 "$srcdir/FID_BKM_fi_FI" "$pkgdir${_installdir}/$pkgname/Languages/Bookmarks.fi-FI.xcl"
 install -Dm644 "$srcdir/FID_BKM_cs_CZ" "$pkgdir${_installdir}/$pkgname/Languages/Bookmarks.cs-CZ.xcl"
 install -Dm644 "$srcdir/FID_BKM_de_DE" "$pkgdir${_installdir}/$pkgname/Languages/Bookmarks.de-DE.xcl"
 install -Dm644 "$srcdir/FID_BKM_fy_NL" "$pkgdir${_installdir}/$pkgname/Languages/Bookmarks.fy-NL.xcl"
 install -Dm644 "$srcdir/FID_BKM_nl_NL" "$pkgdir${_installdir}/$pkgname/Languages/Bookmarks.nl-NL.xcl"
 install -Dm644 "$srcdir/FID_BKM_it_IT" "$pkgdir${_installdir}/$pkgname/Languages/Bookmarks.it-IT.xcl"
 install -Dm644 "$srcdir/FID_BKM_pt_PT" "$pkgdir${_installdir}/$pkgname/Languages/Bookmarks.pt-PT.xcl"
 install -Dm644 "$srcdir/FID_BKM_es_ES" "$pkgdir${_installdir}/$pkgname/Languages/Bookmarks.es-ES.xcl"
 install -Dm644 "$srcdir/FID_BKM_ja_JP" "$pkgdir${_installdir}/$pkgname/Languages/Bookmarks.ja-JP.xcl"
 install -Dm644 "$srcdir/FID_BKM_uk_UA" "$pkgdir${_installdir}/$pkgname/Languages/Bookmarks.uk-UA.xcl"
 install -Dm644 "$srcdir/FID_BKM_ru_RU" "$pkgdir${_installdir}/$pkgname/Languages/Bookmarks.ru-RU.xcl"
 install -Dm644 "$srcdir/FID_EDT_sv_SE" "$pkgdir${_installdir}/$pkgname/Languages/Strings.sv-SE.xcl"
 install -Dm644 "$srcdir/FID_EDT_hu_HU" "$pkgdir${_installdir}/$pkgname/Languages/Strings.hu-HU.xcl"
 install -Dm644 "$srcdir/FID_EDT_da_DK" "$pkgdir${_installdir}/$pkgname/Languages/Strings.da-DK.xcl"
 install -Dm644 "$srcdir/FID_EDT_tr_TR" "$pkgdir${_installdir}/$pkgname/Languages/Strings.tr-TR.xcl"
 install -Dm644 "$srcdir/FID_EDT_zh_TW" "$pkgdir${_installdir}/$pkgname/Languages/Strings.zh-TW.xcl"
 install -Dm644 "$srcdir/FID_EDT_ko_KR" "$pkgdir${_installdir}/$pkgname/Languages/Strings.ko-KR.xcl"
 install -Dm644 "$srcdir/FID_EDT_he_IL" "$pkgdir${_installdir}/$pkgname/Languages/Strings.he-IL.xcl"
 install -Dm644 "$srcdir/FID_EDT_pt_PT" "$pkgdir${_installdir}/$pkgname/Languages/Strings.pt-PT.xcl"
 install -Dm644 "$srcdir/FID_EDT_fr_CH" "$pkgdir${_installdir}/$pkgname/Languages/Strings.fr-CH.xcl"
 install -Dm644 "$srcdir/FID_EDT_zh_CN" "$pkgdir${_installdir}/$pkgname/Languages/Strings.zh-CN.xcl"
 install -Dm644 "$srcdir/FID_EDT_ro_RO" "$pkgdir${_installdir}/$pkgname/Languages/Strings.ro-RO.xcl"
 install -Dm644 "$srcdir/FID_EDT_fr_FR" "$pkgdir${_installdir}/$pkgname/Languages/Strings.fr-FR.xcl"
 install -Dm644 "$srcdir/FID_EDT_sk_SK" "$pkgdir${_installdir}/$pkgname/Languages/Strings.sk-SK.xcl"
 install -Dm644 "$srcdir/FID_EDT_pl_PL" "$pkgdir${_installdir}/$pkgname/Languages/Strings.pl-PL.xcl"
 install -Dm644 "$srcdir/FID_EDT_it_IT" "$pkgdir${_installdir}/$pkgname/Languages/Strings.it-IT.xcl"
 install -Dm644 "$srcdir/FID_EDT_es_ES" "$pkgdir${_installdir}/$pkgname/Languages/Strings.es-ES.xcl"
 install -Dm644 "$srcdir/FID_EDT_fi_FI" "$pkgdir${_installdir}/$pkgname/Languages/Strings.fi-FI.xcl"
 install -Dm644 "$srcdir/FID_EDT_ja_JP" "$pkgdir${_installdir}/$pkgname/Languages/Strings.ja-JP.xcl"
 install -Dm644 "$srcdir/FID_EDT_fy_NL" "$pkgdir${_installdir}/$pkgname/Languages/Strings.fy-NL.xcl"
 install -Dm644 "$srcdir/FID_EDT_cs_CZ" "$pkgdir${_installdir}/$pkgname/Languages/Strings.cs-CZ.xcl"
 install -Dm644 "$srcdir/FID_EDT_nl_NL" "$pkgdir${_installdir}/$pkgname/Languages/Strings.nl-NL.xcl"
 install -Dm644 "$srcdir/FID_EDT_de_DE" "$pkgdir${_installdir}/$pkgname/Languages/Strings.de-DE.xcl"
 install -Dm644 "$srcdir/FID_EDT_el_GR" "$pkgdir${_installdir}/$pkgname/Languages/Strings.el-GR.xcl"
 install -Dm644 "$srcdir/FID_EDT_uk_UA" "$pkgdir${_installdir}/$pkgname/Languages/Strings.uk-UA.xcl"
 install -Dm644 "$srcdir/FID_EDT_ru_RU" "$pkgdir${_installdir}/$pkgname/Languages/Strings.ru-RU.xcl"

 install -Dm644 "$srcdir/FID_OCR_dat_spa" "$pkgdir${_installdir}/$pkgname/PluginsData/OCRLanguages/spa_pxvocr.dat"
 install -Dm644 "$srcdir/FID_OCR_dat_deu" "$pkgdir${_installdir}/$pkgname/PluginsData/OCRLanguages/deu_pxvocr.dat"
 install -Dm644 "$srcdir/FID_OCR_dat_fra" "$pkgdir${_installdir}/$pkgname/PluginsData/OCRLanguages/fra_pxvocr.dat"
 install -Dm644 "$srcdir/FID_OCR_dat_eng" "$pkgdir${_installdir}/$pkgname/PluginsData/OCRLanguages/eng_pxvocr.dat"
 install -Dm644 "$srcdir/FID_OCR_lng_eng" "$pkgdir${_installdir}/$pkgname/PluginsData/OCRLanguages/eng_pxvocr.lng"
 install -Dm644 "$srcdir/FID_OCR_lng_deu" "$pkgdir${_installdir}/$pkgname/PluginsData/OCRLanguages/deu_pxvocr.lng"
 install -Dm644 "$srcdir/FID_OCR_lng_spa" "$pkgdir${_installdir}/$pkgname/PluginsData/OCRLanguages/spa_pxvocr.lng"
 install -Dm644 "$srcdir/FID_OCR_lng_fra" "$pkgdir${_installdir}/$pkgname/PluginsData/OCRLanguages/fra_pxvocr.lng"

 install -Dm644 "$srcdir/FID_Stamps_DynamicDate" "$pkgdir${_installdir}/$pkgname/Stamps/ENU/DynamicDate.pdf"

 if [ "$CARCH" == "x86_64" ]; then
	install -Dm644 "$srcdir/FID_KeybHook64" "$pkgdir${_installdir}/$pkgname/Plugins.x64/FowpKbd64.dll"
	install -Dm644 "$srcdir/FID_ReadOutLoud64" "$pkgdir${_installdir}/$pkgname/Plugins.x64/ReadOutLoud.pvp"
	install -Dm644 "$srcdir/FID_Optimizer64" "$pkgdir${_installdir}/$pkgname/Plugins.x64/PDFOptimizer.pvp"
	install -Dm644 "$srcdir/FID_SpellChecker64" "$pkgdir${_installdir}/$pkgname/Plugins.x64/SpellChecker.pvp"
	install -Dm644 "$srcdir/FID_GD64" "$pkgdir${_installdir}/$pkgname/Plugins.x64/GoogleDrive.pvp"
	install -Dm644 "$srcdir/FID_Bookmarks64" "$pkgdir${_installdir}/$pkgname/Plugins.x64/Bookmarks.pvp"
	install -Dm644 "$srcdir/FID_DB64" "$pkgdir${_installdir}/$pkgname/Plugins.x64/DropBox.pvp"
	install -Dm644 "$srcdir/FID_SP64" "$pkgdir${_installdir}/$pkgname/Plugins.x64/SharePoint.pvp"
	install -Dm644 "$srcdir/FID_FileOpenSH64" "$pkgdir${_installdir}/$pkgname/Plugins.x64/FileOpenSH.pvp"
	install -Dm644 "$srcdir/FID_OffConv64" "$pkgdir${_installdir}/$pkgname/Plugins.x64/ConvertPDF.pvp"
	install -Dm644 "$srcdir/FID_PDFA64" "$pkgdir${_installdir}/$pkgname/Plugins.x64/PDFAPlugin.pvp"
	install -Dm644 "$srcdir/FID_OCR64" "$pkgdir${_installdir}/$pkgname/Plugins.x64/OCRPlugin.pvp"

	install -Dm644 "$srcdir/FID_ViewerDLL64" "$pkgdir${_installdir}/$pkgname/PDFXEditCore.x64.dll"
 fi

 if [ "$CARCH" == "i686" ]; then
	install -Dm644 "$srcdir/FID_KeybHook32" "$pkgdir${_installdir}/$pkgname/Plugins.x86/FowpKbd.dll"
	install -Dm644 "$srcdir/FID_ReadOutLoud32" "$pkgdir${_installdir}/$pkgname/Plugins.x86/ReadOutLoud.pvp"
	install -Dm644 "$srcdir/FID_Optimizer32" "$pkgdir${_installdir}/$pkgname/Plugins.x86/PDFOptimizer.pvp"
	install -Dm644 "$srcdir/FID_SpellChecker32" "$pkgdir${_installdir}/$pkgname/Plugins.x86/SpellChecker.pvp"
	install -Dm644 "$srcdir/FID_GD32" "$pkgdir${_installdir}/$pkgname/Plugins.x86/GoogleDrive.pvp"
	install -Dm644 "$srcdir/FID_Bookmarks32" "$pkgdir${_installdir}/$pkgname/Plugins.x86/Bookmarks.pvp"
	install -Dm644 "$srcdir/FID_DB32" "$pkgdir${_installdir}/$pkgname/Plugins.x86/DropBox.pvp"
	install -Dm644 "$srcdir/FID_SP32" "$pkgdir${_installdir}/$pkgname/Plugins.x86/SharePoint.pvp"
	install -Dm644 "$srcdir/FID_FileOpenSH32" "$pkgdir${_installdir}/$pkgname/Plugins.x86/FileOpenSH.pvp"
	install -Dm644 "$srcdir/FID_OffConv32" "$pkgdir${_installdir}/$pkgname/Plugins.x86/ConvertPDF.pvp"
	install -Dm644 "$srcdir/FID_PDFA32" "$pkgdir${_installdir}/$pkgname/Plugins.x86/PDFAPlugin.pvp"
	install -Dm644 "$srcdir/FID_OCR32" "$pkgdir${_installdir}/$pkgname/Plugins.x86/OCRPlugin.pvp"

	install -Dm644 "$srcdir/FID_ViewerDLL32" "$pkgdir${_installdir}/$pkgname/PDFXEditCore.x86.dll"
 fi
 
 install -Dm755 "$srcdir/FID_EditorEXE" "$pkgdir${_installdir}/$pkgname/PDFXEdit.exe" 
 install -Dm644 "$srcdir/FID_Resource" "$pkgdir${_installdir}/$pkgname/Resources.dat"
 install -Dm644 "$srcdir/FID_ViewerLicense" "$pkgdir/usr/share/licenses/$pkgname/PDF_VE_V6.pdf"

 icotool -x "$srcdir/Icon.AppIco" -o "$srcdir"

 _num=1 
 for _size in 256 128 64 48 32 24 16; do
 	#install -Dm644 "$srcdir/out-${_num}.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
	install -Dm644 "$srcdir/Icon.AppIco_${_num}_${_size}x${_size}x32.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
        _num=$((_num + 1))
 done

 gendesk -n -f \
          --pkgname="${pkgname}" \
          --pkgdesc="${pkgdesk}" \
          --name="PDF-XChange" \
          --categories="Utility" \
          --startupnotify=true \
          --comment="$pkgdesc" \
          --mimetypes="application/pdf" \
          --custom="StartupWMClass=PDFXEdit.exe"

 sed -i "s/Exec=${pkgname}/Exec=${pkgname} \%f/" "$srcdir/$pkgname.desktop"

 install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
 
 mkdir -p "$pkgdir/usr/bin"

 echo '#!/bin/bash' > "$pkgdir/usr/bin/$pkgname"
 echo "program=\"${pkgname}\"" >> "$pkgdir/usr/bin/$pkgname"
 echo 'if [ ! -d "$HOME/.$program/wine" ] ; then' >> "$pkgdir/usr/bin/$pkgname"
 echo '   mkdir -p "$HOME/.$program/wine"' >> "$pkgdir/usr/bin/$pkgname"
 echo 'fi' >> "$pkgdir/usr/bin/$pkgname"
 echo  'if [ ! -z "$1" ] ; then' >> "$pkgdir/usr/bin/$pkgname"
 echo '   document=$(WINEPREFIX="$HOME/.$program/wine" /usr/bin/winepath -w "$1")' >> "$pkgdir/usr/bin/$pkgname"
 echo 'else' >> "$pkgdir/usr/bin/$pkgname"
 echo '   unset document' >> "$pkgdir/usr/bin/$pkgname"
 echo 'fi' >> "$pkgdir/usr/bin/$pkgname"
 echo 'WINEPREFIX="$HOME/.$program/wine" /usr/bin/wine '\"${_installdir}'/$program/PDFXEdit.exe" "$document"' >> "$pkgdir/usr/bin/$pkgname"

 chmod 0755 "$pkgdir/usr/bin/$pkgname"

}
